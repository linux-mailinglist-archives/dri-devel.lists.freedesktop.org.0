Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6DBA4250
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2019 06:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F026E287;
	Sat, 31 Aug 2019 04:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E506E287
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2019 04:55:02 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204725] black screen
Date: Sat, 31 Aug 2019 04:55:01 +0000
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
Message-ID: <bug-204725-2300-09zseuNOdB@https.bugzilla.kernel.org/>
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
b21tZW50ICM4IGZyb20gRG1pdHJpIFNlbGV0c2tpIChkcmpvbXNAZ21haWwuY29tKSAtLS0KKElu
IHJlcGx5IHRvIERtaXRyaSBTZWxldHNraSBmcm9tIGNvbW1lbnQgIzcpCj4gSSBub3RpY2VkLCB0
aGF0IHdoZW4gaSBkbyB0aGlzLCBJIGdldCB0aGlzOgo+IGxzcGNpIHwgZ3JlcCAtaSBWR0EKPiAw
ZDowMC4wIFZHQSBjb21wYXRpYmxlIGNvbnRyb2xsZXI6IEFkdmFuY2VkIE1pY3JvIERldmljZXMs
IEluYy4gW0FNRC9BVEldCj4gRGV2aWNlIDczMWYgKHJldiBjMSkKPiAKPiBNeSBndWVzcyBpcyB0
aGF0IG15IGRldmljZSBmb3Igc29tZSByZWFzb24gaXMgbm90IHJlY29nbmlzZWQuCj4gCj4gSG93
IHdvdWxkIEkgZ28gYWJvdXQgaXQ/CgpzY3JhdGNoIHRoYXQuIG1hbmlwdWxhdGlvbiB3aXRoIEdQ
VSBkb2VzIGhhcHBlbi4gSnVzdCBsb29rcyBsaWtlIGJhZCBzdHJpbmcgaW4KdGhlIG91dHB1dCB0
aGF0IGRvZXMgbm90IGRlc2NyaWJlIGFjdHVhbCBjYXJkLgoKQWxzbywgaWYgdGhhdCBtYWtlcyBh
bnkgZGlmZmVyZW5jZSwgSSBoYXZlIGRpc3BsYXkgcG9ydCB0byBEVkkgYWRhcHRlci4KZm9yIHNv
bWUgcmVhc29uIG15IEJFTlEgc2NyZWVuIGRpZCBub3QgbGlrZSBkaXJlY3QgSERNSSBjYWJsZS4g
Q2hlYXBlc3QgSERNSQpjYWJsZSBpbiBJIGNvdWxkIGZpbmQuCgpXaXRoIHRoYXQgc2FpZCwgaSBh
bSB3cml0aW5nIHRob3NlIHdvcmRzIGZyb20gVkVTQSBYb3JnLCB1c2luZyBzYWlkIGRpc3BsYXlw
b3J0CnRvIERWSSBhZGFwdGVyLihsb29rcyBsaWtlIHBhc3NpdmUgZGV2aWNlKQoKLS0gCllvdSBh
cmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3Np
Z25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
