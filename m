Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EB72BC5E7
	for <lists+dri-devel@lfdr.de>; Sun, 22 Nov 2020 14:56:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A1F89A5C;
	Sun, 22 Nov 2020 13:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E66F89A5C
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Nov 2020 13:56:39 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205675] Display locks up. AMDGPU timeout
Date: Sun, 22 Nov 2020 13:56:38 +0000
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
Message-ID: <bug-205675-2300-k38XIZliwx@https.bugzilla.kernel.org/>
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

--- Comment #21 from swebwaer (gosesen253@tjuln.com) ---
https://gitlab.com/gitlab-org/gitlab/-/issues/286915
https://gitlab.com/gitlab-org/gitlab/-/issues/286916
https://gitlab.com/gitlab-org/gitlab/-/issues/286917
https://gitlab.com/gitlab-org/gitlab/-/issues/286918
https://gitlab.com/gitlab-org/gitlab/-/issues/286919
https://gitlab.com/gitlab-org/gitlab/-/issues/286920
https://gitlab.com/gitlab-org/gitlab/-/issues/286921
https://gitlab.com/gitlab-org/gitlab/-/issues/286922
https://gitlab.com/gitlab-org/gitlab/-/issues/286923
https://gitlab.com/gitlab-org/gitlab/-/issues/286924
https://gitlab.com/gitlab-org/gitlab/-/issues/286925
https://gitlab.com/gitlab-org/gitlab/-/issues/286926
https://gitlab.com/gitlab-org/gitlab/-/issues/286927
https://gitlab.com/gitlab-org/gitlab/-/issues/286936
https://gitlab.com/gitlab-org/gitlab/-/issues/286937
https://gitlab.com/gitlab-org/gitlab/-/issues/286947
https://gitlab.com/gitlab-org/gitlab/-/issues/286938
https://gitlab.com/gitlab-org/gitlab/-/issues/286939
https://gitlab.com/gitlab-org/gitlab/-/issues/286940
https://gitlab.com/gitlab-org/gitlab/-/issues/286941
https://gitlab.com/gitlab-org/gitlab/-/issues/286942
https://gitlab.com/gitlab-org/gitlab/-/issues/286944
https://gitlab.com/gitlab-org/gitlab/-/issues/286945
https://gitlab.com/gitlab-org/gitlab/-/issues/286946
https://gitlab.com/gitlab-org/gitlab/-/issues/286960
https://gitlab.com/gitlab-org/gitlab/-/issues/286961
https://gitlab.com/gitlab-org/gitlab/-/issues/286962
https://gitlab.com/gitlab-org/gitlab/-/issues/286963
https://gitlab.com/gitlab-org/gitlab/-/issues/286964
https://gitlab.com/gitlab-org/gitlab/-/issues/286965
https://gitlab.com/gitlab-org/gitlab/-/issues/286966
https://gitlab.com/gitlab-org/gitlab/-/issues/286967
https://gitlab.com/gitlab-org/gitlab/-/issues/286968
https://gitlab.com/gitlab-org/gitlab/-/issues/286969
https://gitlab.com/gitlab-org/gitlab/-/issues/286970
https://blog.goo.ne.jp/fchfchhh/e/2544129c960d1fcbc7b434405ee51a1e
https://paiza.io/projects/4bN8Sjb9JjRk6CmN4APlrQ?language=php
https://note.com/srnsetrdytfuygu/n/n9b6b1e135091
https://www.postads.ph/ad/en-direct-ligue-1-suivez-montpellier-strasbourg-sur-france

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
