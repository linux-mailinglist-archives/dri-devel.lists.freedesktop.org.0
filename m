Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4090C14B69
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 16:02:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388AA8937C;
	Mon,  6 May 2019 14:02:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618E88937C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 14:02:27 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 160D927F2B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 14:02:27 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 14B6F28675; Mon,  6 May 2019 14:02:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203525] New: brightness with function buttons Acer Aspire
 A315-41 notebook with AMD Ryzen 5 2500U
Date: Mon, 06 May 2019 14:02:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erikjohansson@flashbox.5july.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-203525-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDM1MjUKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjAzNTI1CiAgICAgICAgICAgU3VtbWFyeTogYnJpZ2h0bmVzcyB3aXRo
IGZ1bmN0aW9uIGJ1dHRvbnMgQWNlciBBc3BpcmUgQTMxNS00MQogICAgICAgICAgICAgICAgICAg
IG5vdGVib29rIHdpdGggQU1EIFJ5emVuIDUgMjUwMFUKICAgICAgICAgICBQcm9kdWN0OiBEcml2
ZXJzCiAgICAgICAgICAgVmVyc2lvbjogMi41CiAgICBLZXJuZWwgVmVyc2lvbjogNC4xOS4zNyA1
LjAuMTEgNS4xCiAgICAgICAgICBIYXJkd2FyZTogeDg2LTY0CiAgICAgICAgICAgICAgICBPUzog
TGludXgKICAgICAgICAgICAgICBUcmVlOiBNYWlubGluZQogICAgICAgICAgICBTdGF0dXM6IE5F
VwogICAgICAgICAgU2V2ZXJpdHk6IG5vcm1hbAogICAgICAgICAgUHJpb3JpdHk6IFAxCiAgICAg
ICAgIENvbXBvbmVudDogVmlkZW8oRFJJIC0gbm9uIEludGVsKQogICAgICAgICAgQXNzaWduZWU6
IGRyaXZlcnNfdmlkZW8tZHJpQGtlcm5lbC1idWdzLm9zZGwub3JnCiAgICAgICAgICBSZXBvcnRl
cjogZXJpa2pvaGFuc3NvbkBmbGFzaGJveC41anVseS5vcmcKICAgICAgICBSZWdyZXNzaW9uOiBO
bwoKSSBnb3QgYW4gQWNlciBBc3BpcmUgQTMxNS00MSBub3RlYm9vayB3aXRoIEFNRCBSeXplbiA1
IDI1MDBVIGFuZCBpIGhhdmUgaGFkCnByb2JsZW1zIHdpdGggYnJpZ2h0bmVzcyBub3Qgd29ya2lu
ZyBvdXQgb2YgdGhlIGJveCAoT1RCKSBpZiBpIHVzZWQgZnVuY3Rpb24KYnV0dG9ucy4KVGhlIHRo
aW5nIGlzIHRoYXQgaSBmb3VuZCB0aGF0IGl0IHN0YXJ0ZWQgdG8gd29yayB3aXRoIGxpbnV4LTQu
MTkuMzcgKGZpeGVkKQpidXQgaXQgZGlkbid0IHdvcmsgd2l0aCBsaW51eC00LjE5LjM1IChicm9r
ZW4pLgoKSXQgd29ya3MgZnJvbSA0LjE5LjM3IGJ1dCBpdCBkb2Vzbid0IHdvcmsgaW4gbGF0ZXIg
a2VybmVsIHNlcmllcyBzdWNoIGFzCmxpbnV4LTUuMC4xMSBvciBsaW51eC01LjEgYW5kIGkgdGhp
bmsgdGhlIGZpeCBzaG91bGQgYWxzbyBiZSBpbiBuZXdlciBrZXJuZWxzLgpJIHN0YXJ0ZWQgdG8g
YmlzZWN0IGJ1dCBsaW51eC00LjE5LjM2IGRvZXNuJ3QgYm9vdCB3aXRoIG15IGhhcmR3YXJlIGFu
ZCBhZnRlcgptYW55IGJpc2VjdCBza2lwIGFuZCBjb21waWxpbmcgaSBnYXZlIHVwLgpEbyBhbnlv
bmUga25vdyB3aGF0IGNvbW1pdCB0aGF0IGNvdWxkIGhhdmUgZml4ZWQgaXQ/Ck9yIHdoeSA0LjE5
LjM2IHdvbid0IGJvb3Qgb24gbXkgaGFyZHdhcmUgKGlmIHRoZXJlIHdhcyBzb21lIGtub3duIHJl
Z3Jlc3Npb24pCnNvIGkgY2FuIHBlcmZvcm0gYW4gYmlzZWN0LgoKLS0gCllvdSBhcmUgcmVjZWl2
aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0
aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
