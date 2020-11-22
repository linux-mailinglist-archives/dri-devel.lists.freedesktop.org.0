Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 723462BC67E
	for <lists+dri-devel@lfdr.de>; Sun, 22 Nov 2020 16:32:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8EF589C94;
	Sun, 22 Nov 2020 15:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF9689C94
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Nov 2020 15:32:30 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205675] Display locks up. AMDGPU timeout
Date: Sun, 22 Nov 2020 15:32:29 +0000
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
Message-ID: <bug-205675-2300-Pvj2BvBBQm@https.bugzilla.kernel.org/>
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

--- Comment #23 from swebwaer (gosesen253@tjuln.com) ---
https://gitlab.com/gitlab-org/gitlab/-/issues/287043
https://gitlab.com/gitlab-org/gitlab/-/issues/287044
https://gitlab.com/gitlab-org/gitlab/-/issues/287045
https://gitlab.com/gitlab-org/gitlab/-/issues/287046
https://gitlab.com/gitlab-org/gitlab/-/issues/287047
https://gitlab.com/gitlab-org/gitlab/-/issues/287048
https://gitlab.com/gitlab-org/gitlab/-/issues/287049
https://gitlab.com/gitlab-org/gitlab/-/issues/287050
https://gitlab.com/gitlab-org/gitlab/-/issues/287051
https://gitlab.com/gitlab-org/gitlab/-/issues/287052
https://gitlab.com/gitlab-org/gitlab/-/issues/287053
https://gitlab.com/gitlab-org/gitlab/-/issues/287054
https://gitlab.com/gitlab-org/gitlab/-/issues/287055
https://gitlab.com/gitlab-org/gitlab/-/issues/287056
https://gitlab.com/gitlab-org/gitlab/-/issues/287057
https://gitlab.com/gitlab-org/gitlab/-/issues/287058
https://gitlab.com/gitlab-org/gitlab/-/issues/287059
https://gitlab.com/gitlab-org/gitlab/-/issues/287060
https://gitlab.com/gitlab-org/gitlab/-/issues/287061
https://paiza.io/projects/LgFAV3s50wme89bHspbRmA?language=php
https://blog.goo.ne.jp/fchfchhh/e/6c3fb33c14bcd515fd83d0d866918e63
https://note.com/srnsetrdytfuygu/n/ne7c1480a7e58
https://www.postads.ph/ad/france-vs-scotland-livestream-free

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
