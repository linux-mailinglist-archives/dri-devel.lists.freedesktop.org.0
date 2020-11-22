Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471E12BC2F1
	for <lists+dri-devel@lfdr.de>; Sun, 22 Nov 2020 02:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F8589DD3;
	Sun, 22 Nov 2020 01:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08E189DD3
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Nov 2020 01:12:03 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205675] Display locks up. AMDGPU timeout
Date: Sun, 22 Nov 2020 01:12:03 +0000
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
Message-ID: <bug-205675-2300-G93X1yBiJF@https.bugzilla.kernel.org/>
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

--- Comment #15 from swebwaer (gosesen253@tjuln.com) ---
https://gitlab.com/gitlab-org/gitlab/-/issues/286634
https://gitlab.com/gitlab-org/gitlab/-/issues/286635
https://gitlab.com/gitlab-org/gitlab/-/issues/286636
https://gitlab.com/gitlab-org/gitlab/-/issues/286637
https://gitlab.com/gitlab-org/gitlab/-/issues/286638
https://gitlab.com/gitlab-org/gitlab/-/issues/286639
https://gitlab.com/gitlab-org/gitlab/-/issues/286640
https://gitlab.com/gitlab-org/gitlab/-/issues/286641
https://gitlab.com/gitlab-org/gitlab/-/issues/286642
https://gitlab.com/gitlab-org/gitlab/-/issues/286643
https://gitlab.com/gitlab-org/gitlab/-/issues/286644
https://gitlab.com/gitlab-org/gitlab/-/issues/286645
https://gitlab.com/gitlab-org/gitlab/-/issues/286646
https://gitlab.com/gitlab-org/gitlab/-/issues/286648
https://gitlab.com/gitlab-org/gitlab/-/issues/286649
https://gitlab.com/gitlab-org/gitlab/-/issues/286650
https://gitlab.com/gitlab-org/gitlab/-/issues/286652
https://paiza.io/projects/FAKh0CzpgjeUt1tWpd77Ag?language=php
https://blog.goo.ne.jp/seresrnetyrt/e/3710e37c7986e499c98c7611b6e5687a
https://note.com/wsrbwanretrytuy/n/nae843a959761
https://www.postads.ph/ad/ufc-255-live-stream-free-watch
https://townsend-poe.medium.com/nobody-creates-themselves-by-themselves-we-are-all-mirror-images-sculpted-through-the-2b54a88df876
https://townsend-poe.medium.com/some-people-might-take-interest-27b0bc90ebc2
https://townsend-poe.medium.com/life-is-a-journey-of-twists-and-turns-peaks-and-valleys-mountains-to-climb-and-oceans-to-explore-25f40a665d64

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
