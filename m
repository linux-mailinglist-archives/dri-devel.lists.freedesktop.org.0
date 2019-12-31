Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C4012D67C
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 07:17:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF526E093;
	Tue, 31 Dec 2019 06:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51846E093
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 06:17:15 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206021] AMDGPU/DC: freesync disabled on the monitor side after
 the monitor sleeps and resumes
Date: Tue, 31 Dec 2019 06:17:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: libcg@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-206021-2300-4NKwsU5ErC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206021-2300@https.bugzilla.kernel.org/>
References: <bug-206021-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDYwMjEKCi0tLSBD
b21tZW50ICMzIGZyb20gQ2zDqW1lbnQgR3XDqXJpbiAobGliY2dAcHJvdG9ubWFpbC5jb20pIC0t
LQpDcmVhdGVkIGF0dGFjaG1lbnQgMjg2NTM1CiAgLS0+IGh0dHBzOi8vYnVnemlsbGEua2VybmVs
Lm9yZy9hdHRhY2htZW50LmNnaT9pZD0yODY1MzUmYWN0aW9uPWVkaXQKbWFudWFsbHkgdHVybmlu
ZyB0aGUgbW9uaXRvciBvZmYgYW5kIG9uIHdpdGggZHJtLmRlYnVnPTYKCi0tIApZb3UgYXJlIHJl
Y2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUg
b2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
