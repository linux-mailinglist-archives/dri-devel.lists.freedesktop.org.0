Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4E6CE52D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 16:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9EB6E0F6;
	Mon,  7 Oct 2019 14:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5423C6E0F6
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 14:24:50 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204725] black screen
Date: Mon, 07 Oct 2019 14:24:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204725-2300-Qh1PCtKNdf@https.bugzilla.kernel.org/>
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
b21tZW50ICM1NCBmcm9tIEFsZXggRGV1Y2hlciAoYWxleGRldWNoZXJAZ21haWwuY29tKSAtLS0K
KEluIHJlcGx5IHRvIERtaXRyaSBTZWxldHNraSBmcm9tIGNvbW1lbnQgIzQ4KQo+IChJbiByZXBs
eSB0byBNaWtlIExvdGhpYW4gZnJvbSBjb21tZW50ICM0NykKPiA+IEl0J3Mgc2VsZWN0ZWQgYXV0
b21hdGljYWxseSBpZiB5b3Ugc2V0IERSTV9GQkRFVl9FTVVMQVRJT04gLSB3aGljaCBpcwo+ID4g
IkVuYWJsZSBsZWdhY3kgZmJkZXYgc3VwcG9ydCBmb3IgeW91ciBtb2Rlc2V0dGluZyBkcml2ZXIi
IGFuZCB1bnNldCBhYm92ZQo+ID4gCj4gPiBUaGF0IHNob3VsZCBnZXQgeW91ciBjb25zb2xlIHdv
cmtpbmcKPiAKPiBNaWtlLCBqdXN0IHRvIGNsYXJpZnksIGNvbnNvbGUgaXMgd29ya2luZyB1bnRp
bCBBTURHUFUgZHJpdmVyIGlzIGxvYWRlZC4KClRoZSBjb25zb2xlIGlzIHJ1bm5pbmcgb24gZWZp
ZmIgb3IgdmdhIG1vZGUgdW50aWwgdGhlIGRyaXZlciBsb2Fkcy4gIElmIHlvdQpkb24ndCBoYXZl
IERSTV9GQkRFVl9FTVVMQVRJT04gZW5hYmxlZCwgdGhlcmUgaXMgbm90aGluZyBmb3IgdGhlIGNv
bnNvbGUgdG8KYmluZCB0byBvbmNlIHRoZSBkcml2ZXIgbG9hZHMuCgotLSAKWW91IGFyZSByZWNl
aXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9m
IHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
