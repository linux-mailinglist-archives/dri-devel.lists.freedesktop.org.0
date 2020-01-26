Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53730149BB5
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2020 16:55:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C50B6E9C9;
	Sun, 26 Jan 2020 15:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE0E6E9C9
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2020 15:55:33 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206299] [nouveau/xen] RTX 20XX instant reboot
Date: Sun, 26 Jan 2020 15:55:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: frederic.epitre@orange.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206299-2300-CQsm1jNo6j@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206299-2300@https.bugzilla.kernel.org/>
References: <bug-206299-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDYyOTkKCi0tLSBD
b21tZW50ICM2IGZyb20gRnLDqWTDqXJpYyBQaWVycmV0IChmcmVkZXJpYy5lcGl0cmVAb3Jhbmdl
LmZyKSAtLS0KKEluIHJlcGx5IHRvIElsaWEgTWlya2luIGZyb20gY29tbWVudCAjNSkKPiBZb3Vy
IGtlcm5lbCBsb2cgZG9lc24ndCBoYXZlIGFueXRoaW5nIHRvbyB3ZWlyZCBpbiBpdCAod2hpY2gg
aXMgZ29vZCkuCj4gSG93ZXZlciBJIGRpZCBzZWUgYSBzaW1pbGFyIHR5cGUgb2YgZXJyb3Igd2l0
aCBzb21lb25lIHVzaW5nIGNvcmVib290Cj4gKGFkbWl0dGVkbHksIHdpdGggYW4gTUNQNzcgSUdQ
KS4gQXJlIHlvdSB1c2luZyBhIG5vbi1vcmlnaW5hbCBib290aW5nCj4gbWVjaGFuaXNtPyBHaXZl
biB0aGF0IHRoZXJlJ3Mgc2lnbmVkIGZpcm13YXJlIHNpdHVhdGlvbnMgZ29pbmcgb24sIHdlIGNh
bid0Cj4ganVzdCByZS1QT1NUIHRoZSBHUFUgZWFzaWx5LCB1bmxpa2UgaW4gdGhlIE1DUDc3IGNh
c2UuCgpJJ20gdXNpbmcgc3RhbmRhcmQgZGVmYXVsdCBiaW9zIChsZWdhY3kgbW9kZSkuCgo+IFRo
ZSBtbWlvIHJlYWQgZmFpbHVyZXMgbWF5IGJlIGEgcmVkIGhlcnJpbmcgLS0gYmFzaWNhbGx5IHdl
IHRyeSB0byBmaWd1cmUKPiBvdXQgd2h5IHRoZSBlcnJvciBoYXBwZW5lZCwgYW5kIGdldCBiYWQg
bW1pbyByZWFkcyBpbiB0aGUgcHJvY2Vzcy4gQ291bGQKPiBqdXN0IGJlIHRoYXQgdGhlIGVycm9y
IGhhbmRsZXIgaGFzbid0IGJlZW4gcHJvcGVybHkgYWRqdXN0ZWQgZm9yIFR1cmluZywgYW5kCj4g
cmVhZHMgZnJvbSBiYWQgcGxhY2VzLgo+IAo+IEknbSBhZnJhaWQgdGhpcyBpcyBvdXQgb2YgbXkg
a25vd2xlZGdlIGJhc2UsIHNvcnJ5LiBQZXJoYXBzIEJlbiB3aWxsIGhhdmUKPiBzb21ldGhpbmcg
Y2xldmVyIHRvIHNheS4KCkhvcGUgc28gYW5kIHRoYW5rIHlvdSBhZ2FpbiBmb3IgeW91ciBmZWVk
YmFjay4KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3
YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
