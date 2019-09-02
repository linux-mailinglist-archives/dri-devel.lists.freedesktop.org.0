Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59884A5438
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 12:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F401B89AF3;
	Mon,  2 Sep 2019 10:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011F889AF3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 10:42:59 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204725] black screen
Date: Mon, 02 Sep 2019 10:42:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: michel@daenzer.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204725-2300-I1v9QdTkkK@https.bugzilla.kernel.org/>
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
b21tZW50ICM0NCBmcm9tIE1pY2hlbCBEw6RuemVyIChtaWNoZWxAZGFlbnplci5uZXQpIC0tLQoo
SW4gcmVwbHkgdG8gRG1pdHJpIFNlbGV0c2tpIGZyb20gY29tbWVudCAjMzkpCj4gL3Vzci9saWI2
NC9kcmkvc3dyYXN0X2RyaS5zbyBmYWlsZWQgKGxpYkxMVk1BTURHUFVDb2RlR2VuLnNvLjg6IGNh
bm5vdCBvcGVuCj4gc2hhcmVkIG9iamVjdCBmaWxlOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5
KQoKQlRXLCBMTFZNIG9ubHkgYnVpbGRzIHNoYXJlZCBsaWJyYXJpZXMgbGlrZSBsaWJMTFZNQU1E
R1BVQ29kZUdlbiBpZgpCVUlMRF9TSEFSRURfTElCUyBpcyBlbmFibGVkIGluIGl0cyBidWlsZCBj
b25maWd1cmF0aW9uLCB3aGljaCBpcyBiYWQgZm9yCnBlcmZvcm1hbmNlIGFuZCBvdGhlciByZWFz
b25zLiBNYWtlIHN1cmUgeW91IGRvbid0IGhhdmUgYW55IGN1c3RvbWl6YXRpb24gd2hpY2gKZW5h
YmxlcyB0aGlzLCBhbmQgaWYgR2VudG9vIGVuYWJsZXMgaXQgYnkgZGVmYXVsdCwgcGxlYXNlIGFz
ayB0aGVtIG5vdCB0by4KTExWTV9CVUlMRF9MTFZNX0RZTElCIHNob3VsZCBiZSBlbmFibGVkIGlu
c3RlYWQuCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUg
d2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
