Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7C62BC2A0
	for <lists+dri-devel@lfdr.de>; Sun, 22 Nov 2020 00:19:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C7B89D4D;
	Sat, 21 Nov 2020 23:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D36889D4D
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Nov 2020 23:19:53 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205675] Display locks up. AMDGPU timeout
Date: Sat, 21 Nov 2020 23:19:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: gosesen253@tjuln.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205675-2300-tGk79I9dC4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205675-2300@https.bugzilla.kernel.org/>
References: <bug-205675-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=205675

--- Comment #12 from swebwaer (gosesen253@tjuln.com) ---
https://gitlab.com/gitlab-org/gitlab/-/issues/286503
https://gitlab.com/gitlab-org/gitlab/-/issues/286504
https://gitlab.com/gitlab-org/gitlab/-/issues/286505
https://gitlab.com/gitlab-org/gitlab/-/issues/286506
https://gitlab.com/gitlab-org/gitlab/-/issues/286507
https://gitlab.com/gitlab-org/gitlab/-/issues/286508
https://gitlab.com/gitlab-org/gitlab/-/issues/286509
https://gitlab.com/gitlab-org/gitlab/-/issues/286510
https://gitlab.com/gitlab-org/gitlab/-/issues/286512
https://gitlab.com/gitlab-org/gitlab/-/issues/286513
https://gitlab.com/gitlab-org/gitlab/-/issues/286514
https://gitlab.com/gitlab-org/gitlab/-/issues/286515
https://gitlab.com/gitlab-org/gitlab/-/issues/286516
https://gitlab.com/gitlab-org/gitlab/-/issues/286528
https://gitlab.com/gitlab-org/gitlab/-/issues/286529
https://gitlab.com/gitlab-org/gitlab/-/issues/286531
https://gitlab.com/gitlab-org/gitlab/-/issues/286532
https://gitlab.com/gitlab-org/gitlab/-/issues/286533
https://gitlab.com/gitlab-org/gitlab/-/issues/286535
https://gitlab.com/gitlab-org/gitlab/-/issues/286536
https://gitlab.com/gitlab-org/gitlab/-/issues/286537
https://gitlab.com/gitlab-org/gitlab/-/issues/286538
https://gitlab.com/gitlab-org/gitlab/-/issues/286539
https://gitlab.com/gitlab-org/gitlab/-/issues/286540
https://gitlab.com/gitlab-org/gitlab/-/issues/286542
https://gitlab.com/gitlab-org/gitlab/-/issues/286543
https://gitlab.com/gitlab-org/gitlab/-/issues/286545
https://paiza.io/projects/mxrHB8xb0yNMwNx-sDDCrQ?language=php
https://blog.goo.ne.jp/seresrnetyrt/e/b6e71226d428398644a395cec3105c0a
https://note.com/wsrbwanretrytuy/n/n2a2bb4176eb4
https://www.postads.ph/ad/live-college-football-stream-watch-ncaaf-stream-online-free

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
