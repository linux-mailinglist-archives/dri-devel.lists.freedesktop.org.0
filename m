Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CF42BC65B
	for <lists+dri-devel@lfdr.de>; Sun, 22 Nov 2020 15:59:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9685189C13;
	Sun, 22 Nov 2020 14:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99FEA89C13
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Nov 2020 14:59:52 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205675] Display locks up. AMDGPU timeout
Date: Sun, 22 Nov 2020 14:59:51 +0000
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
Message-ID: <bug-205675-2300-ch0TcDN4NU@https.bugzilla.kernel.org/>
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

--- Comment #22 from swebwaer (gosesen253@tjuln.com) ---
https://gitlab.com/gitlab-org/gitlab/-/issues/286988
https://gitlab.com/gitlab-org/gitlab/-/issues/286989
https://gitlab.com/gitlab-org/gitlab/-/issues/286990
https://gitlab.com/gitlab-org/gitlab/-/issues/286991
https://gitlab.com/gitlab-org/gitlab/-/issues/286992
https://gitlab.com/gitlab-org/gitlab/-/issues/286993
https://gitlab.com/gitlab-org/gitlab/-/issues/286994
https://gitlab.com/gitlab-org/gitlab/-/issues/286995
https://gitlab.com/gitlab-org/gitlab/-/issues/286996
https://gitlab.com/gitlab-org/gitlab/-/issues/286997
https://gitlab.com/gitlab-org/gitlab/-/issues/286998
https://gitlab.com/gitlab-org/gitlab/-/issues/287014
https://gitlab.com/gitlab-org/gitlab/-/issues/287017
https://gitlab.com/gitlab-org/gitlab/-/issues/287018
https://gitlab.com/gitlab-org/gitlab/-/issues/287019
https://gitlab.com/gitlab-org/gitlab/-/issues/287020
https://gitlab.com/gitlab-org/gitlab/-/issues/287021
https://gitlab.com/gitlab-org/gitlab/-/issues/287022
https://gitlab.com/gitlab-org/gitlab/-/issues/287024
https://gitlab.com/gitlab-org/gitlab/-/issues/287025
https://gitlab.com/gitlab-org/gitlab/-/issues/287026
https://gitlab.com/gitlab-org/gitlab/-/issues/287027
https://gitlab.com/gitlab-org/gitlab/-/issues/287028
https://gitlab.com/gitlab-org/gitlab/-/issues/287029
https://gitlab.com/gitlab-org/gitlab/-/issues/287030
https://gitlab.com/gitlab-org/gitlab/-/issues/287031
https://paiza.io/projects/PohD4VpklsnAN_Sm1GmNrQ?language=php
https://blog.goo.ne.jp/fchfchhh/e/d4e13e8159632e3cc26d5ed9f8523c4e
https://note.com/srnsetrdytfuygu/n/ncee04e4cafb0
https://www.postads.ph/ad/serbwaewanrwewnaereswaenrestrytuy

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
