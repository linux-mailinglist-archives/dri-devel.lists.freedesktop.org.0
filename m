Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E749154F
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2019 09:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F226E040;
	Sun, 18 Aug 2019 07:15:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DF76E040
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2019 07:15:26 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 328992847D
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2019 07:15:26 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 27862288A9; Sun, 18 Aug 2019 07:15:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204609] New: amdgpu: powerplay failed send message
Date: Sun, 18 Aug 2019 07:15:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kingoipo@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-204609-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ2MDkKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjA0NjA5CiAgICAgICAgICAgU3VtbWFyeTogYW1kZ3B1OiBwb3dlcnBs
YXkgZmFpbGVkIHNlbmQgbWVzc2FnZQogICAgICAgICAgIFByb2R1Y3Q6IERyaXZlcnMKICAgICAg
ICAgICBWZXJzaW9uOiAyLjUKICAgIEtlcm5lbCBWZXJzaW9uOiA1LjMuMC1yYzMtZHJtLW5leHQK
ICAgICAgICAgIEhhcmR3YXJlOiB4ODYtNjQKICAgICAgICAgICAgICAgIE9TOiBMaW51eAogICAg
ICAgICAgICAgIFRyZWU6IE1haW5saW5lCiAgICAgICAgICAgIFN0YXR1czogTkVXCiAgICAgICAg
ICBTZXZlcml0eTogbm9ybWFsCiAgICAgICAgICBQcmlvcml0eTogUDEKICAgICAgICAgQ29tcG9u
ZW50OiBWaWRlbyhEUkkgLSBub24gSW50ZWwpCiAgICAgICAgICBBc3NpZ25lZTogZHJpdmVyc192
aWRlby1kcmlAa2VybmVsLWJ1Z3Mub3NkbC5vcmcKICAgICAgICAgIFJlcG9ydGVyOiBraW5nb2lw
b0BnbWFpbC5jb20KICAgICAgICBSZWdyZXNzaW9uOiBObwoKQ3JlYXRlZCBhdHRhY2htZW50IDI4
NDQ4MwogIC0tPiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvYXR0YWNobWVudC5jZ2k/aWQ9
Mjg0NDgzJmFjdGlvbj1lZGl0CmRtZXNnCgpBbHdheXMgd2hlbiBib290aW5nIGFuZCBzb21ldGlt
ZXMgZHVyaW5nIHJlZ3VsYXIgdXNhZ2UsIHRoZSBmb2xsb3dpbmcgbWVzc2FnZXMKYXBwZWFyOgoK
PiBhbWRncHU6IFtwb3dlcnBsYXldIGZhaWxlZCBzZW5kIG1lc3NhZ2U6IFRyYW5zZmVyVGFibGVT
bXUyRHJhbSAoMTgpICAgcGFyYW06Cj4gMHgwMDAwMDAwNiByZXNwb25zZSAweGZmZmZmZmMyCj4g
YW1kZ3B1OiBbcG93ZXJwbGF5XSBmYWlsZWQgc2VuZCBtZXNzYWdlOiBOdW1PZkRpc3BsYXlzICg2
NCkgICBwYXJhbToKPiAweDAwMDAwMDAyIHJlc3BvbnNlIDB4ZmZmZmZmYzIKCk15IGhhcmR3YXJl
IGlzIGEgU2FwcGhpcmUgUlggNTcwMCBvbiBhbiB4NTcwIG1vdGhlcmJvYXJkLiBUaGUga2VybmVs
IGlzIGJ1aWxkCmZyb20gaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9+YWdkNWYvbGludXgv
bG9nLz9oPWRybS1uZXh0IGNvbW1pdAoyODM3OTFjYmIyMDJhZTczMDAyZGU0YTZjNTNmODM1ZTQ0
MDZiMjc2LgpNZXNhIGlzIGZyb20gb2liYWYncyBwcGEgZm9yIHVidW50dSAxOS4wNDoKaHR0cHM6
Ly9sYXVuY2hwYWQubmV0L35vaWJhZi8rYXJjaGl2ZS91YnVudHUvZ3JhcGhpY3MtZHJpdmVycz9m
aWVsZC5zZXJpZXNfZmlsdGVyPWRpc2NvClhvcmcgaXMgZGlzdHJvIHByb3ZpZGVkIDEuMjAuNCB3
aXRoIGFtZGdwdSBkcml2ZXIgdmVyc2lvbiAxOS4wLjEKCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0
aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1
Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
