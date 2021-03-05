Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A7A32EEEC
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 16:35:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 147D76EB8E;
	Fri,  5 Mar 2021 15:34:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22976EB8E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 15:34:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7F0B76509B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 15:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614958498;
 bh=E3KG2v7Ts1IJ4/8GCZTMenXlighJqE+xwFyYytr1YZk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=nN1tcrEaufoii/YMBHHBa3EuGukbeQNlb97zrdVBbcNzx8LZjrQtuqkW/acE+Q6B6
 96CtSqzNqEe7CgrBxAAiDImnpdFuBegQ5aKSXKfdBSMC6HZ1C3sF5LY7EvwH+wdQJJ
 MQ/1BU4lAu7PXCY+JlFIuTaCAeGTaoG4frL/5jdcOEdCAG+lf9ctwWSMJC5USn9NeM
 M3c2v2FT0Lzn6iJgvpQD5qNFtxKNW+r1u/1WWfhigIS5LlYuh+MIxHwqVZlrn1OJWe
 rzXyVGJLuJe97unzOori/33Cp48jRSs2VjMD1vtXzhzyRqK64bgx6gc/spD/gS+ucK
 pV7fbiNqTAx4g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 7C4A4651E0; Fri,  5 Mar 2021 15:34:58 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209457] AMDGPU resume fail with RX 580 GPU
Date: Fri, 05 Mar 2021 15:34:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209457-2300-5PrqO7rwHj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209457-2300@https.bugzilla.kernel.org/>
References: <bug-209457-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=209457

--- Comment #21 from Alex Deucher (alexdeucher@gmail.com) ---
Unless you have a polaris board please file your own bug.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
