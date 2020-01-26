Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F341D149D1C
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2020 23:02:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77456E270;
	Sun, 26 Jan 2020 22:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF7356E270
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2020 22:02:18 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206299] [nouveau/xen] RTX 20XX instant reboot
Date: Sun, 26 Jan 2020 22:02:18 +0000
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
Message-ID: <bug-206299-2300-GbFWwANRtX@https.bugzilla.kernel.org/>
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
b21tZW50ICM5IGZyb20gRnLDqWTDqXJpYyBQaWVycmV0IChmcmVkZXJpYy5lcGl0cmVAb3Jhbmdl
LmZyKSAtLS0KQSByYXRoZXIgc2ltcGxlIGFuZCB0ZW1wb3JhcnkgZml4IHdlIGZvdW5kIGlzIHRv
IGFkZDoKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9k
aXNwL2NoYW5udjUwLmMKYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9kaXNw
L2NoYW5udjUwLmMKaW5kZXggYmNmMzJkOTJlZTVhLi41MGUzNTM5ZjMzZDIgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2Rpc3AvY2hhbm52NTAuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9kaXNwL2NoYW5udjUwLmMKQEAg
LTc0LDYgKzc0LDggQEAgbnY1MF9kaXNwX2NoYW5fbXRoZChzdHJ1Y3QgbnY1MF9kaXNwX2NoYW4g
KmNoYW4sIGludCBkZWJ1ZykKCiAgICAgICAgaWYgKGRlYnVnID4gc3ViZGV2LT5kZWJ1ZykKICAg
ICAgICAgICAgICAgIHJldHVybjsKKyAgICAgICBpZiAoIW10aGQpCisgICAgICAgICAgICAgICBy
ZXR1cm47CgogICAgICAgIGZvciAoaSA9IDA7IChsaXN0ID0gbXRoZC0+ZGF0YVtpXS5tdGhkKSAh
PSBOVUxMOyBpKyspIHsKICAgICAgICAgICAgICAgIHUzMiBiYXNlID0gY2hhbi0+aGVhZCAqIG10
aGQtPmFkZHI7CgpXaXRoIHRoYXQsIGl0IHJlbWFpbnMgc3RhYmxlLgoKLS0gCllvdSBhcmUgcmVj
ZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBv
ZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
