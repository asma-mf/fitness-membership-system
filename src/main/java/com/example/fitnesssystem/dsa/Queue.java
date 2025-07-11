package com.example.fitnesssystem.dsa;

import com.example.fitnesssystem.models.MemberShip;

import java.util.ArrayList;

public class Queue {
    private ArrayList<MemberShip> queue;

    public Queue() {
      this.queue = new ArrayList<>();
    }

    public void insertMemberShip(MemberShip memberShip) {
        queue.add(memberShip);
    }

    public MemberShip removeMemberShip() {
        if(queue.isEmpty()) {
            System.out.println("Queue is empty");
            return null;
        }
        return queue.remove(0);
    }
    public MemberShip peekFrontMemberShip() {
        if(queue.isEmpty()){
            System.out.println("Queue is empty");
            return null;
        }
        return queue.get(0);
    }



}
