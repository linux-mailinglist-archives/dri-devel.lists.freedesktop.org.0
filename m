Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D3ACF8E8
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 13:52:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE5B89C1A;
	Tue,  8 Oct 2019 11:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA7A89C1A
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 11:52:03 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205049] garbled graphics
Date: Tue, 08 Oct 2019 11:52:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lskrejci@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205049-2300-2KAjQ1YVc2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205049-2300@https.bugzilla.kernel.org/>
References: <bug-205049-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUwNDkKCkx1a8Oh
xaEgS3JlasSNw60gKGxza3JlamNpQGdtYWlsLmNvbSkgY2hhbmdlZDoKCiAgICAgICAgICAgV2hh
dCAgICB8UmVtb3ZlZCAgICAgICAgICAgICAgICAgICAgIHxBZGRlZAotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCiAgICAgICAgICAgICAgICAgQ0N8ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHxsc2ty
ZWpjaUBnbWFpbC5jb20KCi0tLSBDb21tZW50ICM2IGZyb20gTHVrw6HFoSBLcmVqxI3DrSAobHNr
cmVqY2lAZ21haWwuY29tKSAtLS0KKEluIHJlcGx5IHRvIGxlY2hwIGZyb20gY29tbWVudCAjNSkK
PiBJZiBJIGFkZCBhIHNwYWNlIGFuZCBwdXQgdGhlIHRleHQgYXQgdGhlIGVuZCBvZiB0aGUgbGFz
dCBsaW5lIHdpdGggdGV4dAo+IGFscmVhZHkgb24gaXQgWy4uLl0KCllvdSBuZWVkIHRvIGFwcGVu
ZCB0byB0aGUgbGluZSB0aGF0IHN0YXJ0cyB3aXRoICJsaW51eCIsIG5vdCB0aGUgbGFzdCBsaW5l
LgpFLmcuIGlmIHlvdSBoYXZlIHNvbWV0aGluZyBsaWtlIHRoaXM6CgpsaW51eCAvdm1saW51ei0z
LjE3LjQtMzAxLmZjMjEueDg2XzY0IHJvb3Q9L2Rldi9tYXBwZXIvZmVkb3JhLXJvb3Qgcm8KaW5p
dHJkIC9pbml0cmFtZnMtMy4xNy40LTMwMS5mYzIxLng4Nl82NC5pbWcKCllvdSBuZWVkIHRvIGNo
YW5nZSBpdCB0byB0aGlzOgoKbGludXggL3ZtbGludXotMy4xNy40LTMwMS5mYzIxLng4Nl82NCBy
b290PS9kZXYvbWFwcGVyL2ZlZG9yYS1yb290IHJvCmFtZGdwdS5wcGZlYXR1cmVtYXNrPTB4ZmZm
ZjNmZmYKaW5pdHJkIC9pbml0cmFtZnMtMy4xNy40LTMwMS5mYzIxLng4Nl82NC5pbWcKCi0tIApZ
b3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUg
YXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
