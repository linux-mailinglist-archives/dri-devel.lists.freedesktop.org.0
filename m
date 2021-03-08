Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C8F330547
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 01:18:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 042ED6E111;
	Mon,  8 Mar 2021 00:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC196E111
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 00:18:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 197C565151
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 00:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615162725;
 bh=AKjBp2cxsjlEQjhsirlKhmLXQVmHSr+v4s2T5qXSDkQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BcVVyp0f2lwz3y0ritqakzlNbi9Xou3BoIEYVhzXc0zSRWEZ0xNe5lPCu3Wr7pD0p
 SoSnrcXCuhTM7lNw9QFyzuKKXEMEdxrC8s6OxV8fp3apMDcjKxF/RGW+OJ0rk/+w+2
 V/REHua2qn8xufBZD6pi7yHQxbu4WntISN/pt4/wdH8adAKkdXjYDMOwG7SAx6nWQD
 oKOU476rarBvtUUqsn6XvWAHzTUQRrZ+qN1FFjRWljBmauJmQ/Vo9Di5dCM3P56+h3
 pTdZTE6Ks25h3eTJBKbKIenUulataZScbwPqaZUu/lajShQsmvJuO30TnxuGcNfTN8
 8bVpqORwGT9Qw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 10D8665343; Mon,  8 Mar 2021 00:18:45 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAyMTIxMDddIFRlbXBlcmF0dXJlIGluY3JlYXNlIGJ5IDE1?=
 =?UTF-8?B?wrBDIG9uIHJhZGVvbiBncHU=?=
Date: Mon, 08 Mar 2021 00:18:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Dieter@nuetzel-hh.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-212107-2300-099sNXQKcc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212107-2300@https.bugzilla.kernel.org/>
References: <bug-212107-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTIxMDcKCkRpZXRl
ciBOw7x0emVsIChEaWV0ZXJAbnVldHplbC1oaC5kZSkgY2hhbmdlZDoKCiAgICAgICAgICAgV2hh
dCAgICB8UmVtb3ZlZCAgICAgICAgICAgICAgICAgICAgIHxBZGRlZAotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCiAgICAgICAgICAgICAgICAgQ0N8ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHxEaWV0
ZXJAbnVldHplbC1oaC5kZQoKLS0tIENvbW1lbnQgIzIgZnJvbSBEaWV0ZXIgTsO8dHplbCAoRGll
dGVyQG51ZXR6ZWwtaGguZGUpIC0tLQpJdCBjb3VsZCBiZSB0aGUgWmVyb0NvcmUgdGhpbmcsIHdo
aWNoIGhhcyBmaW5hbGx5IGxhbmRlZCB3aXRoIDUuMTEuClBsZWFzZSB2ZXJpZnksIHRoYXQgeW91
ciBnZnggZmFucyBzdG9wcGVkIHdpdGggNS4xMSBhbmQgcnVubmluZyB3aXRoIGFsbAprZXJuZWxz
IGJlbG93IDUuMTEuCgotLSAKWW91IG1heSByZXBseSB0byB0aGlzIGVtYWlsIHRvIGFkZCBhIGNv
bW1lbnQuCgpZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRj
aGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
