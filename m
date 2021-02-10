Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0685317333
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 23:20:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA576ED0D;
	Wed, 10 Feb 2021 22:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB136ED0D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 22:20:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 798B664ECF
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 22:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612995608;
 bh=4kys/WDg/wDzbAd0rv0OP0TYQJETwt42anaEzqt7jVI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qyxzQpS4x9vKtrOe9lcCHdLF4N+GJClBbSfukZMifXCiiCNIQAll/N68kQvIkVZgc
 WCBuVhq0rlDl7AhFZ913ikoXLdwCNyNoA9UNHW5mU5FQ4KGGVWl7V8yRF20ayHu29W
 n/bVs8Ph0wbnthHzoWno2AcweFrr7VTGG5O6zKW3hRti/n06OoJuzx+F/9SeDSD5/f
 yM0r27akfOa/yUsOwc1UwiLSU3VNmb3+Edk6wiUJmP1hcU69BrKyK2RHKOSqZnP94L
 rUtK+Ak0+PHPYQSxpM7WILSD6Jt8FOspFDYqQxAxBgoJebUGFNkfBKgTNkha1Div8t
 GEprMozv+ED5A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6B1FC65259; Wed, 10 Feb 2021 22:20:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211651] Dual screen not working with Nvidia GTX 1050ti in a
 notebook
Date: Wed, 10 Feb 2021 22:20:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-211651-2300-NmFxGzINWC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211651-2300@https.bugzilla.kernel.org/>
References: <bug-211651-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211651

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WILL_NOT_FIX

--- Comment #3 from Artem S. Tashkinov (aros@gmx.com) ---
NVIDIA drivers are outside of control of Linux kernel developers, so you're
very unlikely to get any help here.

Please try asking here:

https://forums.developer.nvidia.com/c/gpu-unix-graphics/linux/148

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
