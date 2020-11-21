Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3549D2BC206
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 21:24:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79EF789B51;
	Sat, 21 Nov 2020 20:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A02D89B51
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Nov 2020 20:24:49 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205675] Display locks up. AMDGPU timeout
Date: Sat, 21 Nov 2020 20:24:49 +0000
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
Message-ID: <bug-205675-2300-off3uJQo9g@https.bugzilla.kernel.org/>
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

--- Comment #8 from swebwaer (gosesen253@tjuln.com) ---
https://gitlab.com/gitlab-org/gitlab/-/issues/286240
https://gitlab.com/gitlab-org/gitlab/-/issues/286241
https://gitlab.com/gitlab-org/gitlab/-/issues/286242
https://gitlab.com/gitlab-org/gitlab/-/issues/286243
https://gitlab.com/gitlab-org/gitlab/-/issues/286244
https://gitlab.com/gitlab-org/gitlab/-/issues/286245
https://gitlab.com/gitlab-org/gitlab/-/issues/286246
https://gitlab.com/gitlab-org/gitlab/-/issues/286247
https://gitlab.com/gitlab-org/gitlab/-/issues/286248
https://gitlab.com/gitlab-org/gitlab/-/issues/286249
https://gitlab.com/gitlab-org/gitlab/-/issues/286250
https://gitlab.com/gitlab-org/gitlab/-/issues/286251
https://gitlab.com/gitlab-org/gitlab/-/issues/286252
https://gitlab.com/gitlab-org/gitlab/-/issues/286253
https://gitlab.com/gitlab-org/gitlab/-/issues/286254
https://gitlab.com/gitlab-org/gitlab/-/issues/286255
https://gitlab.com/gitlab-org/gitlab/-/issues/286256
https://paiza.io/projects/9t2Xx-W2SBAgj_rN2FRRgQ?language=php
https://blog.goo.ne.jp/seresrnetyrt/e/987ab172ddb60cd1dfa76e6e89ea7478
https://pastebin.com/AxWE36bL
https://note.com/wsrbwanretrytuy/n/ne79a7f718241
https://www.postads.ph/ad/daniil-medvedev-vs-rafael-nadal-live-atp-finals-2020

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
