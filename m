Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F6B3303EB
	for <lists+dri-devel@lfdr.de>; Sun,  7 Mar 2021 19:29:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E07266E5BD;
	Sun,  7 Mar 2021 18:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821C26E5BD
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Mar 2021 18:29:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9F7E8650CC
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Mar 2021 18:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615141773;
 bh=QoYyT9CQVEUh5ge/5goE/oWwxgfD0BDbv5Q7fK82wQo=;
 h=From:To:Subject:Date:From;
 b=CPfo6JJ20434NNL+t0ygQvE3N02BtL5oihc9u670NoNd1eQ/a7kpJunWJVodUEZm3
 ZLmz1lM0RaCZaghOEx5jHAZ5b8GYKaQ05cASTOTWHJklSGsK0+Y+XzP6xu4XeUagXs
 uCWESG2hvsPWTFyUwFgAx4Lj+3ed5VpFiavdfdPnBhQV58a/phO4F0LB7oxH007J1j
 eqi2NS2ne6HO75tD4s2PWqw5PIodqobB01TMEEmTG2kzzmYiTb4mV3egKsFb6X47FQ
 OEvxuxsvoS4TpmmQ6svf8plqeimM6sRd/Cfjb3k1gdLoXlSuQzORtMW9WZRXutBKva
 5T8Ffmi+SzK9w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 920D065343; Sun,  7 Mar 2021 18:29:33 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAyMTIxMDddIE5ldzogVGVtcGVyYXR1cmUgaW5jcmVhc2Ug?=
 =?UTF-8?B?YnkgMTXCsEMgb24gcmFkZW9uIGdwdQ==?=
Date: Sun, 07 Mar 2021 18:29:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: martin.tk@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-212107-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTIxMDcKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjEyMTA3CiAgICAgICAgICAgU3VtbWFyeTogVGVtcGVyYXR1cmUgaW5j
cmVhc2UgYnkgMTXCsEMgb24gcmFkZW9uIGdwdQogICAgICAgICAgIFByb2R1Y3Q6IERyaXZlcnMK
ICAgICAgICAgICBWZXJzaW9uOiAyLjUKICAgIEtlcm5lbCBWZXJzaW9uOiA1LjExCiAgICAgICAg
ICBIYXJkd2FyZTogeDg2LTY0CiAgICAgICAgICAgICAgICBPUzogTGludXgKICAgICAgICAgICAg
ICBUcmVlOiBNYWlubGluZQogICAgICAgICAgICBTdGF0dXM6IE5FVwogICAgICAgICAgU2V2ZXJp
dHk6IG5vcm1hbAogICAgICAgICAgUHJpb3JpdHk6IFAxCiAgICAgICAgIENvbXBvbmVudDogVmlk
ZW8oRFJJIC0gbm9uIEludGVsKQogICAgICAgICAgQXNzaWduZWU6IGRyaXZlcnNfdmlkZW8tZHJp
QGtlcm5lbC1idWdzLm9zZGwub3JnCiAgICAgICAgICBSZXBvcnRlcjogbWFydGluLnRrQGdteC5j
b20KICAgICAgICBSZWdyZXNzaW9uOiBObwoKQ3JlYXRlZCBhdHRhY2htZW50IDI5NTcwMQogIC0t
PiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvYXR0YWNobWVudC5jZ2k/aWQ9Mjk1NzAxJmFj
dGlvbj1lZGl0CmRtZXNnLmxvZwoKU2luY2UgdXBncmFkaW5nIG15IGtlcm5lbCBmcm9tIDUuMTAu
MTYgdG8gNS4xMS4zIEkgbm90aWNlZCBhbiBpbmNyZWFzZSBpbgp0ZW1wZXJhdHVyZSBvbiBteSBB
TUQgZ3B1IChSYWRlb24gUlg1NTApLiBJIGxhdGVyIHRyaWVkIGJvdGggNS4xMC4yMCBhbmQgNS4x
MS40CmFuZCBJIGNhbiBub3RpY2UgdGhlIGluY3JlYXNlIGluIHRlbXBlcmF0dXJlIG9ubHkgb24g
NS4xMSBrZXJuZWwuCgpJbiBhZGRpdGlvbiB0byB0aGUgdGVtcGVyYXR1cmUgSSBub3RpY2VkIHRo
YXQgdGhlIGZhbiBvbiBncHUgd291bGQgc3BpbiB1cCB0bwptYXggcnBtIGZvciBhIHNlY29uZCBv
ciB0d28gcmlnaHQgYWZ0ZXIgd2FraW5nIHVwIHRoZSBQQyBmcm9tIHNsZWVwLiBJJ3ZlIG5ldmVy
Cm5vdGljZWQgc3VjaCBiZWhhdmlvdXIgYmVmb3JlLgoKSSBjYW4ndCBzZWUgYW55IGVycm9ycyBp
biB0aGUgbG9ncyBhbmQgdGhlIHN5c3RlbSBzZWVtcyB0byBiZSBydW5uaW5nIG5vcm1hbC4KTm8g
Y3Jhc2hlcyBub3IgZGVncmFkZWQgcGVyZm9ybWFuY2UgZWl0aGVyLgoKSSBjaGVjayB0ZW1wZXJh
dHVyZSB1c2luZyBzZW5zb3JzIHV0aWxpdHkuIEZvciA1LjExLjQgaXQgc2hvd3MgdGhlIGZvbGxv
d2luZzoKCjFzdCBydW46CgphbWRncHUtcGNpLTAxMDAKQWRhcHRlcjogUENJIGFkYXB0ZXIKdmRk
Z2Z4OiAgICAgIDk2Mi4wMCBtViAKZmFuMTogICAgICAgICA5NjMgUlBNICAobWluID0gICAgMCBS
UE0sIG1heCA9IDM1MDAgUlBNKQplZGdlOiAgICAgICAgICs1NC4wwrBDICAoY3JpdCA9ICs5Ny4w
wrBDLCBoeXN0ID0gLTI3My4xwrBDKQpwb3dlcjE6ICAgICAgICA5LjEzIFcgIChjYXAgPSAgMzYu
MDAgVykKCgoybmQgcnVuIGZldyBtaW51dGVzIGxhdGVyOgoKYW1kZ3B1LXBjaS0wMTAwCkFkYXB0
ZXI6IFBDSSBhZGFwdGVyCnZkZGdmeDogICAgICA4MjUuMDAgbVYgCmZhbjE6ICAgICAgICAgOTc4
IFJQTSAgKG1pbiA9ICAgIDAgUlBNLCBtYXggPSAzNTAwIFJQTSkKZWRnZTogICAgICAgICArNDcu
MMKwQyAgKGNyaXQgPSArOTcuMMKwQywgaHlzdCA9IC0yNzMuMcKwQykKcG93ZXIxOiAgICAgICAg
Ny4xOSBXICAoY2FwID0gIDM2LjAwIFcpCgoKNS4xMS4zOgphbWRncHUtcGNpLTAxMDAKQWRhcHRl
cjogUENJIGFkYXB0ZXIKdmRkZ2Z4OiAgICAgIDk2Mi4wMCBtViAKZmFuMTogICAgICAgICA5OTEg
UlBNICAobWluID0gICAgMCBSUE0sIG1heCA9IDM1MDAgUlBNKQplZGdlOiAgICAgICAgICs1Ny4w
wrBDICAoY3JpdCA9ICs5Ny4wwrBDLCBoeXN0ID0gLTI3My4xwrBDKQpwb3dlcjE6ICAgICAgICA5
LjA4IFcgIChjYXAgPSAgMzYuMDAgVykKCgp0aGVzZSB0d28gYXJlIG9uIDUuMTAuMTY6CgphbWRn
cHUtcGNpLTAxMDAKQWRhcHRlcjogUENJIGFkYXB0ZXIKdmRkZ2Z4OiAgICAgIDc4Ny4wMCBtViAK
ZmFuMTogICAgICAgICA5NzYgUlBNICAobWluID0gICAgMCBSUE0sIG1heCA9IDM1MDAgUlBNKQpl
ZGdlOiAgICAgICAgICszOS4wwrBDICAoY3JpdCA9ICs5Ny4wwrBDLCBoeXN0ID0gLTI3My4xwrBD
KQpwb3dlcjE6ICAgICAgICA2LjExIFcgIChjYXAgPSAgMzYuMDAgVykKCmFtZGdwdS1wY2ktMDEw
MApBZGFwdGVyOiBQQ0kgYWRhcHRlcgp2ZGRnZng6ICAgICAgOTYyLjAwIG1WIApmYW4xOiAgICAg
ICAgIDk3NiBSUE0gIChtaW4gPSAgICAwIFJQTSwgbWF4ID0gMzUwMCBSUE0pCmVkZ2U6ICAgICAg
ICAgKzQwLjDCsEMgIChjcml0ID0gKzk3LjDCsEMsIGh5c3QgPSAtMjczLjHCsEMpCnBvd2VyMTog
ICAgICAgIDguMjYgVyAgKGNhcCA9ICAzNi4wMCBXKQoKCgpJJ20gYXR0YWNoaW5nIHBhcnRzIG9m
IGRtZXNnIGxvZyBJIHRob3VnaHQgcmVsZXZhbnQuCgotLSAKWW91IG1heSByZXBseSB0byB0aGlz
IGVtYWlsIHRvIGFkZCBhIGNvbW1lbnQuCgpZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVj
YXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
