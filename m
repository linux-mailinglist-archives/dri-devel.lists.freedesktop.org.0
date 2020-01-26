Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEA7149D14
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2020 22:45:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC916E26F;
	Sun, 26 Jan 2020 21:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58DED6E26F
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2020 21:45:27 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206299] [nouveau/xen] RTX 20XX instant reboot
Date: Sun, 26 Jan 2020 21:45:26 +0000
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
Message-ID: <bug-206299-2300-8iz6c1hJuD@https.bugzilla.kernel.org/>
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
b21tZW50ICM4IGZyb20gRnLDqWTDqXJpYyBQaWVycmV0IChmcmVkZXJpYy5lcGl0cmVAb3Jhbmdl
LmZyKSAtLS0KV2UgZm91bmQgbW9yZSBpbmZvcm1hdGlvbiEKClRoZSBwcmV2aW91cyB0ZXN0cyB3
YXMgZG9uZSB3aXRoIHRob3NlIGFkZGVkIGxpbmVzOgoKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbnZrbS9lbmdpbmUvZGlzcC9jaGFubnY1MC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L252a20vZW5naW5lL2Rpc3AvY2hhbm52NTAuYwpAQCAtNzUsMTMgKzc1LDI1IEBAIG52
NTBfZGlzcF9jaGFuX210aGQoc3RydWN0IG52NTBfZGlzcF9jaGFuICpjaGFuLCBpbnQgZGVidWcp
CiAgICAgICAgaWYgKGRlYnVnID4gc3ViZGV2LT5kZWJ1ZykKICAgICAgICAgICAgICAgIHJldHVy
bjsKCisgICAgICAgbnZrbV93YXJuKHN1YmRldiwgIm10aGQ6ICVwIiwgbXRoZCk7CisgICAgICAg
bnZrbV93YXJuKHN1YmRldiwgIm10aGQtPmRhdGE6ICVwIiwgbXRoZC0+ZGF0YSk7CisgICAgICAg
bnZrbV93YXJuKHN1YmRldiwgIiZtdGhkLT5kYXRhWzBdOiAlcCIsICZtdGhkLT5kYXRhWzBdKTsK
KyAgICAgICBudmttX3dhcm4oc3ViZGV2LCAibXRoZC0+ZGF0YVswXS5tdGhkOiAlcCIsIG10aGQt
PmRhdGFbMF0ubXRoZCk7CiAgICAgICAgZm9yIChpID0gMDsgKGxpc3QgPSBtdGhkLT5kYXRhW2ld
Lm10aGQpICE9IE5VTEw7IGkrKykgewoKd2hpY2ggZ2F2ZXMgYXMgY3Jhc2hsb2c6CgpbICAgNDUu
NTEzNjE3XSBub3V2ZWF1IDAwMDA6MjY6MDAuMDogZGlzcDogY2hpZCA3MyBzdGF0IDAwMDAxMDgw
IHJlYXNvbiAxCltQVVNIQlVGRkVSX0VSUl0gbXRoZCAwMjAwIGRhdGEgYmFkZjUwNDAgY29kZSBi
YWRmNTA0MApbICAgNDUuNTEzNjMzXSBub3V2ZWF1IDAwMDA6MjY6MDAuMDogZGlzcDogbXRoZDog
MDAwMDAwMDBkZmE1NTcwOApbICAgNDUuNTEzNjM4XSBub3V2ZWF1IDAwMDA6MjY6MDAuMDogZGlz
cDogbXRoZC0+ZGF0YTogMDAwMDAwMDA4NThhZjgwZgpbICAgNDUuNTEzNjQxXSBub3V2ZWF1IDAw
MDA6MjY6MDAuMDogZGlzcDogJm10aGQtPmRhdGFbMF06IDAwMDAwMDAwODU4YWY4MGYKCkJ1dCBy
ZXBsYWNpbmcgIiVwIiBieSAiJWx4IiwgaXQgcmV2ZWFsZWQgdGhhdCBtdGhkIGlzIE5VTEw6Cgpb
ICAgNzQuNzUzMjA3XSBub3V2ZWF1IDAwMDA6MjY6MDAuMDogZGlzcDogY2hpZCA3MyBzdGF0IDAw
MDAxMDgwIHJlYXNvbiAxCltQVVNIQlVGRkVSX0VSUl0gbXRoZCAwMjAwIGRhdGEgYmFkZjUwNDAg
Y29kZSBiYWRmNTA0MApbICAgNzQuNzUzMjIzXSBub3V2ZWF1IDAwMDA6MjY6MDAuMDogZGlzcDog
bXRoZDogMApbICAgNzQuNzUzMjI2XSBub3V2ZWF1IDAwMDA6MjY6MDAuMDogZGlzcDogbXRoZC0+
ZGF0YTogMTAKWyAgIDc0Ljc1MzIzMV0gbm91dmVhdSAwMDAwOjI2OjAwLjA6IGRpc3A6ICZtdGhk
LT5kYXRhWzBdOiAxMApbICAgNzQuNzUzMjQxXSBCVUc6IGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVy
ZWZlcmVuY2UsIGFkZHJlc3M6IDAwMDAwMDAwMDAwMDAwMjAKWyAgIDc0Ljc1MzI0NF0gI1BGOiBz
dXBlcnZpc29yIHJlYWQgYWNjZXNzIGluIGtlcm5lbCBtb2RlCgpUaGF0IGdpdmVzIHNvbWUgaGlu
dHMhCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0
Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
