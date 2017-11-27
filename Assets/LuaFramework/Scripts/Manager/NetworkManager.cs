using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;
using LuaInterface;

namespace LuaFramework
{
    public class NetEvent
    {
        public SocketClient.MessageHandler func;
        public int eventID;
        public LuaByteBuffer data;
    }

    public class NetworkManager : Manager 
    {
        static readonly object m_lockObject = new object();
        static Queue<NetEvent> mEvents = new Queue<NetEvent>();

        ///------------------------------------------------------------------------------------
        public static void AddEvent(SocketClient.MessageHandler func, int eventID, ref LuaByteBuffer data)
        {
            lock (m_lockObject)
            {
                NetEvent e = new NetEvent();
                e.func = func;
                e.eventID = eventID;
                e.data = data;
                mEvents.Enqueue(e);
            }
        }

        /// <summary>
        /// 交给Command，这里不想关心发给谁。
        /// </summary>
        void Update()
        {
            if (mEvents.Count > 0)
            {
                while (mEvents.Count > 0)
                {
                    NetEvent e = mEvents.Dequeue();
                    e.func(e.eventID, e.data);
                }
            }
        }

    }
}