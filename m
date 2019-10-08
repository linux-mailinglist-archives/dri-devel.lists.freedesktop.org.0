Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9854ECF6EF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 12:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBF06E0E7;
	Tue,  8 Oct 2019 10:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5866E0E7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 10:22:38 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205049] garbled graphics
Date: Tue, 08 Oct 2019 10:22:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lechp@onet.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205049-2300-xIQqJR7ia2@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUwNDkKCi0tLSBD
b21tZW50ICM1IGZyb20gbGVjaHBAb25ldC5wbCAtLS0KT2ssIHRoaXMgaXMgd2hhdCBJJ3ZlIHRy
aWVkOiBob2xkaW5nIHNoaWZ0IHRvIGZvcmNlIHRoZSBib290IG1lbnUgdG8gc2hvdyB1cCwKdGhl
biBwcmVzc2luZyBlIHRvIGVkaXQgdGhlIG9wdGlvbnMgZm9yIGtlcm5lbCB2ZXJzaW9uIDUuMi4x
NywgdGhlbiBhcHBlbmRpbmcKYW1kZ3B1LnBwZmVhdHVyZW1hc2s9MHhmZmZmM2ZmZiwgYW5kIGZp
bmFsbHkgcHJlc3NpbmcgQ3RybC14LgoKSWYgSSBhZGQgYSBzcGFjZSBhbmQgcHV0IHRoZSB0ZXh0
IGF0IHRoZSBlbmQgb2YgdGhlIGxhc3QgbGluZSB3aXRoIHRleHQgYWxyZWFkeQpvbiBpdCwgdGhl
IGVycm9yIGFwcGVhcnMgZm9yIGEgZmV3IHNlY29uZHMsIHRoZW4gdGhlIExlbm92byBzcGxhc2gg
c2NyZWVuCmFwcGVhcnMgaW5kZWZpbml0ZWx5IGFuZCBub3RoaW5nIGVsc2UgaGFwcGVucyB1bnRp
bCBJIGN5Y2xlIHRoZSBwb3dlci4KCk9uIHRoZSBvdGhlciBoYW5kLCBpZiBJIHB1dCB0aGUgdGV4
dCBvbiBhIG5ldyBsaW5lLCB0aGVyZSdzIG5vIGVycm9yIG1lc3NhZ2UKYW5kIEZlZG9yYSBib290
cyBub3JtYWxseSwgYnV0IHRoZSBncmFwaGljcyBpc3N1ZXMgcGVyc2lzdC4KSSB0cmllZCBhIHRv
dGFsIG9mIDYgZGlmZmVyZW50IGJvb3QgZWRpdHMgd2l0aCBhbWRncHUucHBmZWF0dXJlbWFzaz0w
eGZmZmYzZmZmLCAKYW1kZ3B1LnBwZmVhdHVyZW1hc2s9MHhmZmZkYmZmZiwgYW5kIGFtZGdwdS5w
cGZlYXR1cmVtYXNrPTB4ZmZmZDNmZmYsIHdpdGggdGhlCnNhbWUgcmVzdWx0IGVhY2ggdGltZS4K
Ci0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGlu
ZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
