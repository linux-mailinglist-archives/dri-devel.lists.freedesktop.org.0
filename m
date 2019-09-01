Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BE8A488E
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2019 11:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B2606E1C0;
	Sun,  1 Sep 2019 09:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDCD6E1C0
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2019 09:20:17 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204725] black screen
Date: Sun, 01 Sep 2019 09:20:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: drjoms@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204725-2300-JqeKpHW2xh@https.bugzilla.kernel.org/>
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
b21tZW50ICMzOSBmcm9tIERtaXRyaSBTZWxldHNraSAoZHJqb21zQGdtYWlsLmNvbSkgLS0tCihJ
biByZXBseSB0byBNaWtlIExvdGhpYW4gZnJvbSBjb21tZW50ICMzNykKPiBJIHRoaW5rIHlvdSBu
ZWVkIENPTkZJR19GQl9TSU1QTEUgJiBDT05GSUdfRkJfQk9PVF9WRVNBX1NVUFBPUlQ9eSBjb25m
aWd1cmVkCj4gCj4gVGhpcyBpcyB3aGF0IEkgaGF2ZSBpbiBteSAuY29uZmlnIGZvciBhIFJ5emVu
IGNhcmQKPiAKPiBDT05GSUdfRFJNX0tNU19GQl9IRUxQRVI9eQo+IENPTkZJR19GQl9DTURMSU5F
PXkKPiBDT05GSUdfRkJfTk9USUZZPXkKPiBDT05GSUdfRkJfQ0ZCX0ZJTExSRUNUPXkKPiBDT05G
SUdfRkJfQ0ZCX0NPUFlBUkVBPXkKPiBDT05GSUdfRkJfQ0ZCX0lNQUdFQkxJVD15Cj4gQ09ORklH
X0ZCX1NZU19GSUxMUkVDVD15Cj4gQ09ORklHX0ZCX1NZU19DT1BZQVJFQT15Cj4gQ09ORklHX0ZC
X1NZU19JTUFHRUJMSVQ9eQo+IENPTkZJR19GQl9TWVNfRk9QUz15Cj4gQ09ORklHX0ZCX0RFRkVS
UkVEX0lPPXkKPiBDT05GSUdfRkJfTU9ERV9IRUxQRVJTPXkKPiBDT05GSUdfRkJfRUZJPXkKPiBD
T05GSUdfRkJfU0lNUExFPXkKPiAKPiBBbmQgSSdtIHN1cmUgSSBoYWQgdGhlIGFib3ZlIGlzc3Vl
IHdoZW4gcGxheWluZyB3aXRoIHRoZXNlIG9wdGlvbnMgYmVmb3JlCgpJIHdpbGwgbWFrZSBzdXJl
IEkgaGF2ZSB5b3VyIGV4YWN0IHNldHRpbmdzLiBEb2VzIGZyYW1lIGJ1ZmZlciBhZmZlY3QKYWNj
ZWxlcmF0aW9uIG9mIGFtZGdwdT8KCk5vdCBzdXJlIHdoYXQgZG8geW91IG1lYW4gUnl6ZW4gY2Fy
ZC4gSSBkb24ndCBoYXZlIEFQVS4ganVzdCBBTUQgQ1BVIFJ5emVuCjE2MDAuCgpjdXJyZW50bHkg
aSBhbSB0cnlpbmcgdG8gZ2V0IHJpZCBvZiB0aGlzOgovdXNyL2xpYjY0L2RyaS9zd3Jhc3RfZHJp
LnNvIGZhaWxlZCAobGliTExWTUFNREdQVUNvZGVHZW4uc28uODogY2Fubm90IG9wZW4Kc2hhcmVk
IG9iamVjdCBmaWxlOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5KQoKaSBhbSByZWNvbXBpbGlu
ZyBtZXNhLCBiZWNhdXNlIGl0IHdhcyBjb21waWxlZCB3aXRoIG9sZCBMTFZNIEkgc3VzcGVjdC4K
T25jZSBJIGRvIHRoYXQgaSB3aWxsIHRyeSB5b3VyIGNvbmZpZy4KCi0tIApZb3UgYXJlIHJlY2Vp
dmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2Yg
dGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
