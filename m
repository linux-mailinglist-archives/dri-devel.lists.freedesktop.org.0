Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB572BC2CF
	for <lists+dri-devel@lfdr.de>; Sun, 22 Nov 2020 01:10:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01461899F2;
	Sun, 22 Nov 2020 00:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D869A899F2
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Nov 2020 00:10:18 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205675] Display locks up. AMDGPU timeout
Date: Sun, 22 Nov 2020 00:10:18 +0000
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
Message-ID: <bug-205675-2300-HzcgQHHEdL@https.bugzilla.kernel.org/>
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

--- Comment #13 from swebwaer (gosesen253@tjuln.com) ---
https://gitlab.com/gitlab-org/gitlab/-/issues/286588
https://gitlab.com/gitlab-org/gitlab/-/issues/286589
https://gitlab.com/gitlab-org/gitlab/-/issues/286590
https://gitlab.com/gitlab-org/gitlab/-/issues/286591
https://gitlab.com/gitlab-org/gitlab/-/issues/286592
https://gitlab.com/gitlab-org/gitlab/-/issues/286593
https://gitlab.com/gitlab-org/gitlab/-/issues/286594
https://gitlab.com/gitlab-org/gitlab/-/issues/286595
https://gitlab.com/gitlab-org/gitlab/-/issues/286596
https://gitlab.com/gitlab-org/gitlab/-/issues/286597
https://gitlab.com/gitlab-org/gitlab/-/issues/286598
https://gitlab.com/gitlab-org/gitlab/-/issues/286599
https://gitlab.com/gitlab-org/gitlab/-/issues/286600
https://gitlab.com/gitlab-org/gitlab/-/issues/286601
https://gitlab.com/gitlab-org/gitlab/-/issues/286602
https://gitlab.com/gitlab-org/gitlab/-/issues/286603
https://gitlab.com/gitlab-org/gitlab/-/issues/286604
https://gitlab.com/gitlab-org/gitlab/-/issues/286605
https://gitlab.com/gitlab-org/gitlab/-/issues/286606
https://gitlab.com/gitlab-org/gitlab/-/issues/286607
https://gitlab.com/gitlab-org/gitlab/-/issues/286608
https://gitlab.com/gitlab-org/gitlab/-/issues/286609
https://paiza.io/projects/p8xBA-vMOqai9X8dE880Tw?language=php
https://blog.goo.ne.jp/seresrnetyrt/e/4944ef76a9178fa97615721fa5ae13f9
https://note.com/wsrbwanretrytuy/n/n1f71923d5a1c
https://www.postads.ph/ad/swaeaqnwaetrydtwaebewanwarestrydtuyu

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
