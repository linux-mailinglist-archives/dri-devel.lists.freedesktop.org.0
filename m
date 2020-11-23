Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB242C1714
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 22:02:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0007C6E0D5;
	Mon, 23 Nov 2020 21:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074ED6E0D5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 21:02:49 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203905] amdgpu:actual_brightness has unreal/wrong value
Date: Mon, 23 Nov 2020 21:02:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: german.rios.gonzalez@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-203905-2300-iL7CKaXt6X@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203905-2300@https.bugzilla.kernel.org/>
References: <bug-203905-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDM5MDUKCkdlcm3D
oW4gUsOtb3MgR29uesOhbGV6IChnZXJtYW4ucmlvcy5nb256YWxlekBnbWFpbC5jb20pIGNoYW5n
ZWQ6CgogICAgICAgICAgIFdoYXQgICAgfFJlbW92ZWQgICAgICAgICAgICAgICAgICAgICB8QWRk
ZWQKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogICAgICAgICAgICAgICAgIENDfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8Z2VybWFuLnJpb3MuZ29uemFsZXpAZ21haWwuCiAgICAgICAgICAgICAg
ICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHxjb20KCi0tLSBDb21tZW50ICMxOCBm
cm9tIEdlcm3DoW4gUsOtb3MgR29uesOhbGV6IChnZXJtYW4ucmlvcy5nb256YWxlekBnbWFpbC5j
b20pIC0tLQooSW4gcmVwbHkgdG8gWGlhIE11IGZyb20gY29tbWVudCAjMTQpCj4gVGhlIGJ1ZyBz
aG91bGQgYmUgZml4ZWQgaW4gNS45LjAtMC5yYzMuIEkgdGVzdGVkIGl0IG9uIG15IGxhcHRvcCB3
aXRoIEFNRAo+IFJ5emVuIDcgUFJPIDQ3NTBVIENQVSB3aXRoIFJlbm9pciBHUFUuCgpJJ20gYWN0
dWFsbHkgdXNpbmcgNS45LjktMjAwLmZjMzMueDg2XzY0IGFuZCB0aGUgcHJvYmxlbSBpdCdzIHN0
aWxsIHRoZXJlCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBh
cmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
