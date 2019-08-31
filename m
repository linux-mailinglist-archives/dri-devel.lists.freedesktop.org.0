Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD208A4636
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2019 22:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF8089D5C;
	Sat, 31 Aug 2019 20:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACB989D5C
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2019 20:39:04 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204725] black screen
Date: Sat, 31 Aug 2019 20:39:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: untaintableangel@hotmail.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204725-2300-TjhTE0hVWg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204725-2300@https.bugzilla.kernel.org/>
References: <bug-204725-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ3MjUKCi0tLSBD
b21tZW50ICMxMyBmcm9tIEFudCAodW50YWludGFibGVhbmdlbEBob3RtYWlsLmNvLnVrKSAtLS0K
SSd2ZSBnb3QgYW4gUlg1NzAwIG15c2VsZiwgc28gbGV0cyBzZWUgaWYgd2UgY2FuJ3QgZ2V0IHRo
aXMgc29ydGVkLgoKQ2FuIEkganVzdCBjaGVjayBzb21ldGhpbmcgLSB0aGUgLmNvbmZpZyBmaWxl
IHlvdSBhdHRhY2hlZCAoY29tbWVudCAxKQpmb3IgdGhlIGtlcm5lbCBoYXMgCgojIERpc3BsYXkg
RW5naW5lIENvbmZpZ3VyYXRpb24KIwpDT05GSUdfRFJNX0FNRF9EQz15CkNPTkZJR19EUk1fQU1E
X0RDX0RDTjFfMD15CkNPTkZJR19EUk1fQU1EX0RDX0RDTjFfMDE9eQojIENPTkZJR19ERUJVR19L
RVJORUxfREMgaXMgbm90IHNldAojIGVuZCBvZiBEaXNwbGF5IEVuZ2luZSBDb25maWd1cmF0aW9u
Cgp3aGVyZWFzIG1pbmUgaGFzIAoKIyBEaXNwbGF5IEVuZ2luZSBDb25maWd1cmF0aW9uCiMKQ09O
RklHX0RSTV9BTURfREM9eQpDT05GSUdfRFJNX0FNRF9EQ19EQ04xXzA9eQpDT05GSUdfRFJNX0FN
RF9EQ19EQ04yXzA9eQpDT05GSUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9SVD15CiMgQ09ORklHX0RF
QlVHX0tFUk5FTF9EQyBpcyBub3Qgc2V0CiMgZW5kIG9mIERpc3BsYXkgRW5naW5lIENvbmZpZ3Vy
YXRpb24KCkkgdGhpbmsgQ09ORklHX0RSTV9BTURfRENfRENOMV8wMSB3YXMgYW4gb3B0aW9uIGJh
Y2sgaW4ga2VybmVsIDUuMiBhbmQgdGhlIG5ldwpvcHRpb24gY29tZXMgaW4gaW4gNS4zKHJjKS4g
S2VybmVsIDUuMyBpcyBhIG5lY2Vzc2l0eSBmb3IgdGhpcyByZWFzb24uIFlvdSd2ZQpnb3QgdGhl
IGxhdGVzdCBtZXNhIGV0YywgY2FuIEkganVzdCBjaGVjayB5b3UgYWxzbyBoYXZlIHRoZSBsYXRl
c3QgbWVzYSBkcm0KY29kZSB0b28/IAoKSWYgdGhlcmUgaXMgaW5zaXN0ZW5jZSB0byB1c2UgYW1k
Z3B1IGFzIGEgbW9kdWxlLCBsZXQncyB0cnkgc2V0dGluZyBhIGNvbmZpZwpmaWxlIHRvIGZvcmNl
IGl0IHRvIGJlIHVzZWQuIEhvdyBhYm91dCB5b3UgY3JlYXRlIHRoaXMgZmlsZSB3aXRoIGEgdGV4
dCBlZGl0b3IKKG9yIG90aGVyd2lzZSBsaWtlIG5hbm8vdmltIGV0Yyk6CgovdXNyL2xvY2FsL3No
YXJlL1gxMS94b3JnLmNvbmYuZC8xMC1hbWRncHUuY29uZgoKYW5kIGZpbGwgaXQgd2l0aCB0aGlz
ICh0YWIgYW4gaW5kZW50YXRpb24gZm9yIGxpbmVzIDIgLSA0KToKClNlY3Rpb24gIk91dHB1dENs
YXNzIgogICAgICAgIElkZW50aWZpZXIgIkFNRGdwdSIKICAgICAgICBNYXRjaERyaXZlciAiYW1k
Z3B1IgogICAgICAgIERyaXZlciAiYW1kZ3B1IgpFbmRTZWN0aW9uCgpBZnRlciByZXN0YXJ0aW5n
LCBpdCBzaG91bGQgZmluZCB0aGUgY2FyZCBhbmQgZm9yY2UgaXQgdG8gdXNlIHRoZSBhbWRncHUK
bW9kdWxlPwoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJl
IHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
