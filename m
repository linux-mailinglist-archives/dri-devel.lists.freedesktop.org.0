Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C72ECA5BD1
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 19:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD2789864;
	Mon,  2 Sep 2019 17:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0039B89864
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 17:26:22 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204725] black screen
Date: Mon, 02 Sep 2019 17:26:22 +0000
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
Message-ID: <bug-204725-2300-GcWn0nFH6W@https.bugzilla.kernel.org/>
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
b21tZW50ICM0NSBmcm9tIERtaXRyaSBTZWxldHNraSAoZHJqb21zQGdtYWlsLmNvbSkgLS0tCihJ
biByZXBseSB0byBNaWNoZWwgRMOkbnplciBmcm9tIGNvbW1lbnQgIzQ0KQo+IChJbiByZXBseSB0
byBEbWl0cmkgU2VsZXRza2kgZnJvbSBjb21tZW50ICMzOSkKPiA+IC91c3IvbGliNjQvZHJpL3N3
cmFzdF9kcmkuc28gZmFpbGVkIChsaWJMTFZNQU1ER1BVQ29kZUdlbi5zby44OiBjYW5ub3Qgb3Bl
bgo+ID4gc2hhcmVkIG9iamVjdCBmaWxlOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5KQo+IAo+
IEJUVywgTExWTSBvbmx5IGJ1aWxkcyBzaGFyZWQgbGlicmFyaWVzIGxpa2UgbGliTExWTUFNREdQ
VUNvZGVHZW4gaWYKPiBCVUlMRF9TSEFSRURfTElCUyBpcyBlbmFibGVkIGluIGl0cyBidWlsZCBj
b25maWd1cmF0aW9uLCB3aGljaCBpcyBiYWQgZm9yCj4gcGVyZm9ybWFuY2UgYW5kIG90aGVyIHJl
YXNvbnMuIE1ha2Ugc3VyZSB5b3UgZG9uJ3QgaGF2ZSBhbnkgY3VzdG9taXphdGlvbgo+IHdoaWNo
IGVuYWJsZXMgdGhpcywgYW5kIGlmIEdlbnRvbyBlbmFibGVzIGl0IGJ5IGRlZmF1bHQsIHBsZWFz
ZSBhc2sgdGhlbSBub3QKPiB0by4gTExWTV9CVUlMRF9MTFZNX0RZTElCIHNob3VsZCBiZSBlbmFi
bGVkIGluc3RlYWQuCgpJIGhhdmUgc2VuZCBlbWFpbCB0byBsbHZtIG1haW50ZWluZXJzIG9mIEdl
bnRvby4gSSBhbSBqdXN0IGEgdXNlciwgaW4gY2FzZQp3aGF0LgoKLS0gCllvdSBhcmUgcmVjZWl2
aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0
aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
