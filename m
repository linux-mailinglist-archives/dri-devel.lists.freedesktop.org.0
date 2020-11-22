Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1552BC775
	for <lists+dri-devel@lfdr.de>; Sun, 22 Nov 2020 18:22:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E989389D6C;
	Sun, 22 Nov 2020 17:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D5C89D6C
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Nov 2020 17:22:52 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205675] Display locks up. AMDGPU timeout
Date: Sun, 22 Nov 2020 17:22:51 +0000
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
Message-ID: <bug-205675-2300-VvRrct7Iae@https.bugzilla.kernel.org/>
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

--- Comment #26 from swebwaer (gosesen253@tjuln.com) ---
https://gitlab.com/gitlab-org/gitlab/-/issues/287175
https://gitlab.com/gitlab-org/gitlab/-/issues/287176
https://gitlab.com/gitlab-org/gitlab/-/issues/287177
https://gitlab.com/gitlab-org/gitlab/-/issues/287178
https://gitlab.com/gitlab-org/gitlab/-/issues/287179
https://gitlab.com/gitlab-org/gitlab/-/issues/287180
https://gitlab.com/gitlab-org/gitlab/-/issues/287181
https://gitlab.com/gitlab-org/gitlab/-/issues/287182
https://gitlab.com/gitlab-org/gitlab/-/issues/287183
https://gitlab.com/gitlab-org/gitlab/-/issues/287184
https://gitlab.com/gitlab-org/gitlab/-/issues/287185
https://gitlab.com/gitlab-org/gitlab/-/issues/287186
https://gitlab.com/gitlab-org/gitlab/-/issues/287187
https://gitlab.com/gitlab-org/gitlab/-/issues/287188
https://gitlab.com/gitlab-org/gitlab/-/issues/287189
https://gitlab.com/gitlab-org/gitlab/-/issues/287190
https://gitlab.com/gitlab-org/gitlab/-/issues/287191
https://gitlab.com/gitlab-org/gitlab/-/issues/287192
https://gitlab.com/gitlab-org/gitlab/-/issues/287193
https://gitlab.com/gitlab-org/gitlab/-/issues/287194
https://gitlab.com/gitlab-org/gitlab/-/issues/287195
https://gitlab.com/gitlab-org/gitlab/-/issues/287196
https://gitlab.com/gitlab-org/gitlab/-/issues/287197
https://gitlab.com/gitlab-org/gitlab/-/issues/287198
https://gitlab.com/gitlab-org/gitlab/-/issues/287199
https://gitlab.com/gitlab-org/gitlab/-/issues/287200
https://paiza.io/projects/4S4DnwhnvoPQS0j0z5GPsA?language=php
https://blog.goo.ne.jp/fchfchhh/e/8fe4a694559024b1191a1c543ba69469
https://note.com/srnsetrdytfuygu/n/n3bdccb8801fc
https://www.postads.ph/ad/baltimore-ravens-vs-tennessee-titans-live-stream-free-nfl

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
