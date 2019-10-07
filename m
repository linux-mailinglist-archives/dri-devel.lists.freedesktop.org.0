Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D38EECE8C2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 18:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F0489E57;
	Mon,  7 Oct 2019 16:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A717C89E57
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 16:11:04 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204725] black screen
Date: Mon, 07 Oct 2019 16:11:03 +0000
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
Message-ID: <bug-204725-2300-OurWjEART4@https.bugzilla.kernel.org/>
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
b21tZW50ICM1NSBmcm9tIERtaXRyaSBTZWxldHNraSAoZHJqb21zQGdtYWlsLmNvbSkgLS0tCihJ
biByZXBseSB0byBBbGV4IERldWNoZXIgZnJvbSBjb21tZW50ICM1NCkKPiAoSW4gcmVwbHkgdG8g
RG1pdHJpIFNlbGV0c2tpIGZyb20gY29tbWVudCAjNDgpCj4gPiAoSW4gcmVwbHkgdG8gTWlrZSBM
b3RoaWFuIGZyb20gY29tbWVudCAjNDcpCj4gPiA+IEl0J3Mgc2VsZWN0ZWQgYXV0b21hdGljYWxs
eSBpZiB5b3Ugc2V0IERSTV9GQkRFVl9FTVVMQVRJT04gLSB3aGljaCBpcwo+ID4gPiAiRW5hYmxl
IGxlZ2FjeSBmYmRldiBzdXBwb3J0IGZvciB5b3VyIG1vZGVzZXR0aW5nIGRyaXZlciIgYW5kIHVu
c2V0IGFib3ZlCj4gPiA+IAo+ID4gPiBUaGF0IHNob3VsZCBnZXQgeW91ciBjb25zb2xlIHdvcmtp
bmcKPiA+IAo+ID4gTWlrZSwganVzdCB0byBjbGFyaWZ5LCBjb25zb2xlIGlzIHdvcmtpbmcgdW50
aWwgQU1ER1BVIGRyaXZlciBpcyBsb2FkZWQuCj4gCj4gVGhlIGNvbnNvbGUgaXMgcnVubmluZyBv
biBlZmlmYiBvciB2Z2EgbW9kZSB1bnRpbCB0aGUgZHJpdmVyIGxvYWRzLiAgSWYgeW91Cj4gZG9u
J3QgaGF2ZSBEUk1fRkJERVZfRU1VTEFUSU9OIGVuYWJsZWQsIHRoZXJlIGlzIG5vdGhpbmcgZm9y
IHRoZSBjb25zb2xlIHRvCj4gYmluZCB0byBvbmNlIHRoZSBkcml2ZXIgbG9hZHMuCgpIZWxsbyBB
bGV4LgoKRG9lcyBub3QgYXBwZWFyIHRvIGJlIHRoZSBjYXNlOgpncmVwIC1SIERSTV9GQkRFVl9F
TVVMQVRJT04gLi8qLy5jb25maWcgIAouL2dpdF9jbG9uZS8uY29uZmlnOkNPTkZJR19EUk1fRkJE
RVZfRU1VTEFUSU9OPXkKLi9saW51eC00LjE0LjgzLWdlbnRvby8uY29uZmlnOkNPTkZJR19EUk1f
RkJERVZfRU1VTEFUSU9OPXkKLi9saW51eC01LjEuMTQtZ2VudG9vLy5jb25maWc6Q09ORklHX0RS
TV9GQkRFVl9FTVVMQVRJT049eQouL2xpbnV4LTUuMi4xMC8uY29uZmlnOkNPTkZJR19EUk1fRkJE
RVZfRU1VTEFUSU9OPXkKLi9saW51eC01LjMuNi5jdXN0b20vLmNvbmZpZzpDT05GSUdfRFJNX0ZC
REVWX0VNVUxBVElPTj15Ci4vbGludXgtNS4zLXJjNi8uY29uZmlnOkNPTkZJR19EUk1fRkJERVZf
RU1VTEFUSU9OPXkKLi9saW51eC01LjMtcmM4Ly5jb25maWc6Q09ORklHX0RSTV9GQkRFVl9FTVVM
QVRJT049eQouL2xpbnV4LTUuNC1yYzEvLmNvbmZpZzpDT05GSUdfRFJNX0ZCREVWX0VNVUxBVElP
Tj15Ci4vbGludXgvLmNvbmZpZzpDT05GSUdfRFJNX0ZCREVWX0VNVUxBVElPTj15Ci4vbGludXgt
bmV4dC1uZXh0LTIwMTkwOTIwLy5jb25maWc6Q09ORklHX0RSTV9GQkRFVl9FTVVMQVRJT049eQoK
CgpBbnkgb3RoZXIgaWRlYXM/IFdvdWxkIGJlIGFwcHJlY2lhdGVkIQpSZWdhcmRzCkRtaXRyaQoK
LS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5n
IHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
