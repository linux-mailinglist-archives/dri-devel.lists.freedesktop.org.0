Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88ACD454B27
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 17:39:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7866E0A2;
	Wed, 17 Nov 2021 16:39:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1465C6E0A2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 16:39:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id DDAD660F90
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 16:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637167139;
 bh=H6sI4hwRnxvXJn0K+WfLb+Cj2BpwXqbWp0bGwSmsGfI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=nf0cSS104n3+RtW0hzBAkGKKDsd+iPnk3WRdiWdGC6+0vut8IjfajMS+GA9yB1XBg
 mdLUi4/TIzRjRYSax1AkqrOYVsE1+3EcLVHqN4zjaI2lwwhNiy6FujY0N8ihL10Qy9
 ORUcxv+nUhsXa88NMz3sVvmR0UZaBuDfDjKaPCETx8Es2kZ5q7k8OwWu/0D0cN3C44
 5cPa/WM+0XM6YTWbom/aDxa5IvfA01WekdnFV8H5NVtG8YOgNgWoN5YVYzufzb9Sul
 nNCwPhY+6oSaBJl29RWRjFFohnPSszXm61lqUTd556ARglVMEdY3l+AxpCT+rcxYCj
 lAXSAXT5VxVOA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D8D9960FC3; Wed, 17 Nov 2021 16:38:59 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214901] amdgpu freezes HP laptop at start up
Date: Wed, 17 Nov 2021 16:38:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: spasswolf@web.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-214901-2300-i8QHYtYpIG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214901-2300@https.bugzilla.kernel.org/>
References: <bug-214901-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214901

spasswolf@web.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |DUPLICATE

--- Comment #7 from spasswolf@web.de ---


*** This bug has been marked as a duplicate of bug 214859 ***

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
