Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F47FA4870
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2019 10:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990A96E1BA;
	Sun,  1 Sep 2019 08:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28BB16E1BA
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2019 08:53:36 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204725] black screen
Date: Sun, 01 Sep 2019 08:53:35 +0000
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
Message-ID: <bug-204725-2300-KK2YbCCRbh@https.bugzilla.kernel.org/>
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
b21tZW50ICMzNSBmcm9tIERtaXRyaSBTZWxldHNraSAoZHJqb21zQGdtYWlsLmNvbSkgLS0tCndl
IGdvdCBzb21lIHByb2dyZXNzLiBPciBtYXkgYmUgbm90LiBTaW5jZSBJIHN1c3BlY3Qgb3JpZ2lu
YWwgaXNzdWUgaXMgc3RpbGwKbm90IHNvbHZlZC4gU3RpbGwgZ2V0IGJsYWNrIHNjcmVlbiB3aGVu
IGFtZGdwdSBpcyBsb2FkZWQuIFRoaXMgdGltZSwgaG93ZXZlciwgSQpjYW4gc3RhcnQgWG9yZywg
d2l0aCBubyAzZCBvciAyZCBhY2NlbGVyYXRpb24sIGJ1dCBub3QgdXNpbmcgVkVTQSBkcml2ZXIs
IGJ1dAp1c2luZyBBTURHUFUuCgpNeSBndWVzcyBpcywgd2UgZml4ZWQgc2Vjb25kIHByb2JsZW0s
IEkgZGlkIG5vdCBrbm93IGV4aXN0ZWQuIFdoaWNoIGlzIGdvb2QgYWxsCnRoZSBzYW1lLgpCZWNh
dXNlIEkgaGFkIHNldmVyYWwgdmVyc2lvbnMgb2YgTExWTSwgb2xkZXIgb25lIHdhcyB1c2VkIGJ5
IGRlZmF1bHQgYW5kIG9ubHkKbmV3ZXIgd2FzIHNob3dpbmcgdXAgYXMgaW5zdGFsbGVkIGJ5IHBv
cnRhZ2UoZ2VudG9vIHBhY2thZ2luZyBzeXN0ZW0pLiBJdCBzaG93cwpvbmx5IGxhc3QgaW5zdGFs
bGVkLiBTaGFtZSBvbiBtZSwgSSBoc291bGQgaGF2ZSBrbm93biBiZXR0ZXIuIFRvIG15IGRlZmVu
Y2UsCnRoZXJlIGFyZSB2ZXJ5IGEgZmV3IHBhY2thZ2VzIHdoZXJlIHlvdSBoYXZlIHNldmVyYWwg
dmVyc2lvbnMgb2Ygc2FtZSBwYWNrYWdlCmluc3RhbGxlZCBhbmQgdGhleSB1c3VhbGx5IGNhbiBi
ZSBjaG9zZWQgdXNpbmcgJ2VzZWxlY3QnIGNvbW1hbmQuCgplc2VsZWN0IHxncmVwIGxsdm0KKG5v
dGhpbmcpCgoKdGhpcyBpcyBub3cgbWUgc2l0dGluZyB1bmRlcjoKdW5hbWUgLWEKTGludXggKG5v
bmUpZGlta28ncyBEZXNrdG9wIDUuMy4wLXJjNisgIzggU01QIFBSRUVNUFQgU3VuIFNlcCAxIDA3
OjM5OjQ0IElTVAoyMDE5IHg4Nl82NCBBTUQgUnl6ZW4gNSAxNjAwIFNpeC1Db3JlIFByb2Nlc3Nv
ciBBdXRoZW50aWNBTUQgR05VL0xpbnV4CgoKCmdseGluZm8gCm5hbWUgb2YgZGlzcGxheTogOjAu
MApFcnJvcjogY291bGRuJ3QgZmluZCBSR0IgR0xYIHZpc3VhbCBvciBmYmNvbmZpZwoKZ2x4Z2Vh
cnMgCkVycm9yOiBjb3VsZG4ndCBnZXQgYW4gUkdCLCBEb3VibGUtYnVmZmVyZWQgdmlzdWFsCgoK
CgpzZWUgbmV3IGRtZXNnKG5vdGhpbmcgaW50ZXJlc3RpbmcgdGhlcmUpCmFuZCBuZXcgWG9yZy5s
b2cgZmlsZXMgaW4gbmV4dCBtZXNzYWdlLihhIGxvdCBvZiBpbnRlcmVzdGluZyB0aGVyZSkKCi0t
IApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0
aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
