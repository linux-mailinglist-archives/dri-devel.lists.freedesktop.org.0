Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C86F3588
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 18:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A5216F748;
	Thu,  7 Nov 2019 17:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054F06F748
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 17:17:29 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205393] [amdgpu powerplay] vega10: custom pp_table, AVFS
 accidentally reenabled after display powersave
Date: Thu, 07 Nov 2019 17:17:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: trivial
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-205393-2300-qv83AFmrJc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205393-2300@https.bugzilla.kernel.org/>
References: <bug-205393-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: mail.kernel.org; dkim=permerror (bad
 message/signature format)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUzOTMKCi0tLSBD
b21tZW50ICMzIGZyb20gQWxleCBEZXVjaGVyIChhbGV4ZGV1Y2hlckBnbWFpbC5jb20pIC0tLQpD
cmVhdGVkIGF0dGFjaG1lbnQgMjg1ODIxCiAgLS0+IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9y
Zy9hdHRhY2htZW50LmNnaT9pZD0yODU4MjEmYWN0aW9uPWVkaXQKcG9zc2libGUgZml4CgpEb2Vz
IHRoaXMgcGF0Y2ggd29yaz8gIEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIG1vdmUgdGhl
IGNoYW5nZSBhYm92ZSB0aGUKY2FsbCB0byB2ZWdhMTBfdXBkYXRlX2F2ZnMoKSB0byBhdm9pZCBl
bmFibGluZyBhdmZzIG9ubHkgdG8gZGlzYWJsZSBpdCBhZ2FpbgpsYXRlci4KCi0tIApZb3UgYXJl
IHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWdu
ZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
