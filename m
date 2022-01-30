Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8A44A361D
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jan 2022 13:07:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A24610ECD6;
	Sun, 30 Jan 2022 12:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 601 seconds by postgrey-1.36 at gabe;
 Sun, 30 Jan 2022 12:07:37 UTC
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB0AE10ECD6
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jan 2022 12:07:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 90B8ECE062A
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jan 2022 11:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE4D9C340E8
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jan 2022 11:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643543851;
 bh=00jLXjENmXsCYnJ07f7MGkOFM/dWHZbc0Hi65JtVhyM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=PyqtGSDB62VI5fZeY6pjmviLoEcFp1CXFVMGAPc8k9WoO+sLIoSSJxti8+IK0qOi1
 I/wesCjDca0UCU79NnnJIQJfx9UWve8FMlzQhna8WVGqCS5pdhdohdLBmxFvsxJ6xE
 EwNxu7OGBf+VZTLv9uB8Jx7KnMKVbGmLwoM+XqY+0SJZLSeVV8b4X8R2y2pX4CZ2wM
 ZIc+g+hH+1/55w6ia03rdZ9cH+lRtvwVGLoaibEHwK65Xvm8/FGxRtY/ow+OUtwDSS
 A8+0+HnMNQiot6+9D7HwjbAV7xEQ/h9prx0tc2DHIK9kQGQ9z4Mf2Plt/UkUysHCUl
 UGbVgxOhzd0GQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id CD360C05FD6; Sun, 30 Jan 2022 11:57:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214197] [Asus G713QY] RX6800M not usable after exiting Vulkan
 application
Date: Sun, 30 Jan 2022 11:57:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: velemas@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-214197-2300-rrW8CqN4w9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214197-2300@https.bugzilla.kernel.org/>
References: <bug-214197-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D214197

velemas@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
