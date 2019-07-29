Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C48E578D45
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 15:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A352189F82;
	Mon, 29 Jul 2019 13:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBADA89F82
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 13:56:35 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 8226627F10
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 13:56:35 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 76B472852A; Mon, 29 Jul 2019 13:56:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204363] New: EDID from Acer P1266 rejected as invalid
Date: Mon, 29 Jul 2019 13:56:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: felixhaedicke@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-204363-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQzNjMKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjA0MzYzCiAgICAgICAgICAgU3VtbWFyeTogRURJRCBmcm9tIEFjZXIg
UDEyNjYgcmVqZWN0ZWQgYXMgaW52YWxpZAogICAgICAgICAgIFByb2R1Y3Q6IERyaXZlcnMKICAg
ICAgICAgICBWZXJzaW9uOiAyLjUKICAgIEtlcm5lbCBWZXJzaW9uOiA1LjIuNAogICAgICAgICAg
SGFyZHdhcmU6IEFsbAogICAgICAgICAgICAgICAgT1M6IExpbnV4CiAgICAgICAgICAgICAgVHJl
ZTogTWFpbmxpbmUKICAgICAgICAgICAgU3RhdHVzOiBORVcKICAgICAgICAgIFNldmVyaXR5OiBu
b3JtYWwKICAgICAgICAgIFByaW9yaXR5OiBQMQogICAgICAgICBDb21wb25lbnQ6IFZpZGVvKERS
SSAtIG5vbiBJbnRlbCkKICAgICAgICAgIEFzc2lnbmVlOiBkcml2ZXJzX3ZpZGVvLWRyaUBrZXJu
ZWwtYnVncy5vc2RsLm9yZwogICAgICAgICAgUmVwb3J0ZXI6IGZlbGl4aGFlZGlja2VAd2ViLmRl
CiAgICAgICAgUmVncmVzc2lvbjogTm8KCldoZW4gcGx1Z2dpbmcgaW4gYW4gQWNlciBQMTI2NiB2
aWEgSERNSSwgSSBnZXQgdGhlIGZvbGxvd2luZyBlcnJvciBtZXNzYWdlczoKClsgICAzNC4zMTkz
NDRdIGFtZGdwdSAwMDAwOjBlOjAwLjA6IEhETUktQS0xOiBFRElEIGlzIGludmFsaWQ6ClsgICAz
NC4zMTkzNDddICBbMDBdIEJBRCAgMDAgZmYgZmYgZmYgZmYgZmYgZmYgMDAgMDQgNzIgMDEgNzAg
MTMgMmYgMDAgMDAKWyAgIDM0LjMxOTM0OF0gIFswMF0gQkFEICAyNyAxMiAwMSAwMyA4MCAwMCAw
MCA3OCAwYSBmZSA0MCBhNCA1NyA1OSA4ZSAyNgpbICAgMzQuMzE5MzQ4XSAgWzAwXSBCQUQgIDAw
IDUwIDVkIGZmIGZmIDgwIDgxIDAwIDgxIDgwIDgxIDQwIDkwIDQwIGE5IDQwClsgICAzNC4zMTkz
NDldICBbMDBdIEJBRCAgOTUgMDAgYjMgMDAgODEgYzAgNjQgMTkgMDAgNDAgNDEgMDAgMjYgMzAg
MTggODgKWyAgIDM0LjMxOTM0OV0gIFswMF0gQkFEICAzNiAwMCAxMyA4ZSAyMSAwMCAwMCAxOCAw
MCAwMCAwMCBmZCAwMCAzMiA1NSAxZQpbICAgMzQuMzE5MzUwXSAgWzAwXSBCQUQgIDY0IDExIDAw
IDBhIDIwIDIwIDIwIDIwIDIwIDIwIDAwIDAwIDAwIGZjIDAwIDQxClsgICAzNC4zMTkzNTBdICBb
MDBdIEJBRCAgNDMgNDUgNTIgMjAgNTAgMzEgMzIgMzYgMzYgMGEgMjAgMjAgMDAgMDAgMDAgZmYK
WyAgIDM0LjMxOTM1MV0gIFswMF0gQkFEICAwMCA0YSAzNyAzMCAzMCAzMSAzMCAzMCAzMSAzNSAz
OSAzMCAzMSAwYSAwMSA5MApbICAgMzQuMzE5NDE1XSBbZHJtOmRjX2xpbmtfZGV0ZWN0IFthbWRn
cHVdXSAqRVJST1IqIE5vIEVESUQgcmVhZC4KClRlc3RlZCB3aXRoIGFtZGdwdSAvIFJhZGVvbiBS
WCBWZWdhIDU2IGFuZCBpOTE1IC8gSW50ZWwgSXJpcyA2MTAwLgoKLS0gCllvdSBhcmUgcmVjZWl2
aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0
aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
