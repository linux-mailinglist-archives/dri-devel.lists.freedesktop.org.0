Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 115ED2BC972
	for <lists+dri-devel@lfdr.de>; Sun, 22 Nov 2020 22:01:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9967789B0B;
	Sun, 22 Nov 2020 21:01:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0F089B0B
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Nov 2020 21:01:27 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205675] Display locks up. AMDGPU timeout
Date: Sun, 22 Nov 2020 21:01:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: fasix52093@tjuln.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205675-2300-nNg9HLkikF@https.bugzilla.kernel.org/>
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

--- Comment #31 from All Event Live Here (fasix52093@tjuln.com) ---
https://gitlab.com/gitlab-org/gitlab/-/issues/287479
https://gitlab.com/gitlab-org/gitlab/-/issues/287481
https://gitlab.com/gitlab-org/gitlab/-/issues/287482
https://gitlab.com/gitlab-org/gitlab/-/issues/287483
https://gitlab.com/gitlab-org/gitlab/-/issues/287484
https://gitlab.com/gitlab-org/gitlab/-/issues/287485
https://gitlab.com/gitlab-org/gitlab/-/issues/287486
https://gitlab.com/gitlab-org/gitlab/-/issues/287488
https://gitlab.com/gitlab-org/gitlab/-/issues/287489
https://gitlab.com/gitlab-org/gitlab/-/issues/287490
https://gitlab.com/gitlab-org/gitlab/-/issues/287491
https://gitlab.com/gitlab-org/gitlab/-/issues/287492
https://gitlab.com/gitlab-org/gitlab/-/issues/287493
https://gitlab.com/gitlab-org/gitlab/-/issues/287495
https://gitlab.com/gitlab-org/gitlab/-/issues/287496
https://gitlab.com/gitlab-org/gitlab/-/issues/287497
https://gitlab.com/gitlab-org/gitlab/-/issues/287498
https://gitlab.com/gitlab-org/gitlab/-/issues/287499
https://paiza.io/projects/Wzr6UA9-Kb7fxKn6dUEi2Q?language=php
https://blog.goo.ne.jp/fchfchhh/e/c21d829ce914bff03d87d9b11e8ffc68
https://note.com/srnsetrdytfuygu/n/na87b757c0de2

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
