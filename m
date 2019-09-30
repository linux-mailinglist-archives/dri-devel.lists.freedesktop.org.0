Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E58DDC1FEE
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 13:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08EC86E3AC;
	Mon, 30 Sep 2019 11:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1206E3AC
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 11:26:02 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205049] New: garbled graphics
Date: Mon, 30 Sep 2019 11:26:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lechp@onet.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-205049-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUwNDkKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjA1MDQ5CiAgICAgICAgICAgU3VtbWFyeTogZ2FyYmxlZCBncmFwaGlj
cwogICAgICAgICAgIFByb2R1Y3Q6IERyaXZlcnMKICAgICAgICAgICBWZXJzaW9uOiAyLjUKICAg
IEtlcm5lbCBWZXJzaW9uOiA1LjIuMTUtMjAwCiAgICAgICAgICBIYXJkd2FyZTogeDg2LTY0CiAg
ICAgICAgICAgICAgICBPUzogTGludXgKICAgICAgICAgICAgICBUcmVlOiBNYWlubGluZQogICAg
ICAgICAgICBTdGF0dXM6IE5FVwogICAgICAgICAgU2V2ZXJpdHk6IG5vcm1hbAogICAgICAgICAg
UHJpb3JpdHk6IFAxCiAgICAgICAgIENvbXBvbmVudDogVmlkZW8oRFJJIC0gbm9uIEludGVsKQog
ICAgICAgICAgQXNzaWduZWU6IGRyaXZlcnNfdmlkZW8tZHJpQGtlcm5lbC1idWdzLm9zZGwub3Jn
CiAgICAgICAgICBSZXBvcnRlcjogbGVjaHBAb25ldC5wbAogICAgICAgIFJlZ3Jlc3Npb246IE5v
CgpJJ20gZ2V0dGluZyBzZXZlcmUgZ3JhcGhpY3MgZ2xpdGNoZXMgaW4gdGhlIGRlc2t0b3AgZW52
aXJvbm1lbnQgKFhGQ0UsIEZlZG9yYQozMCwgb24gTGVub3ZvIElkZWFwYWQgMzMwLTE1QVJSIHdp
dGggUnl6ZW4gMyksIGluY2x1ZGluZyB0ZXh0LCB0ZXh0IGN1cnNvciwKaW1hZ2VzLCBidXR0b25z
IGFuZCBvdGhlciBHVUkgZWxlbWVudHMgaW5jbHVkaW5nIHNjcmVlbiBicmlnaHRuZXNzIHBvcC11
cHMuClRoZSBhbm5veWFuY2UgbGV2ZWwgaXMgc2V2ZXJlLCBhbmQgdXNhYmlsaXR5IGlzIGFsc28g
YWZmZWN0ZWQuIEFzIGNhbiBiZSBzZWVuCmluIHRoZSBhdHRhY2htZW50LCB0aGUgb3V0cHV0IG9m
ICJ1bmFtZSAtYSIgaXMgcGFydGx5IGdhcmJsZWQuIEluIHRoaXMgY2FzZSBJCmtub3cgcm91Z2hs
eSB3aGF0IHRoZSBvdXRwdXQgc2hvdWxkIGhhdmUgYmVlbiwgYnV0IEkgd291bGQgYmUgd2FyeSBv
ZiBkb2luZwpleHRlbnNpdmUgZGVidWdnaW5nIGlmIEkgY2FuJ3QgdHJ1c3Qgd2hhdCBJIHNlZSBv
biB0aGUgc2NyZWVuLgoKU29tZSBvZiB0aGUgZXJyb3JzIGxhc3QgZm9yIGFib3V0IGEgc2Vjb25k
IGJlZm9yZSBzZWxmLWNvcnJlY3RpbmcuIE90aGVycwpwZXJzaXN0IHVudGlsIHNvbWUgYWN0aXZp
dHkgbGlrZSBjbGlja2luZyBvbiBhIGJ1dHRvbiB3aXRoIHRoZSBtb3VzZSAncHJvbXB0cycKdGhl
IGFmZmVjdGVkIGFyZWEgb2YgdGhlIGRpc3BsYXkgdG8gYmUgcmVmcmVzaGVkLgoKSG93IHRvIHJl
cHJvZHVjZToKTm9ybWFsIGludGVyYWN0aW9uIHdpdGggRC5FLiB1c2luZyBtb3VzZSBhbmQga2V5
Ym9hcmQuCgpUZW1wb3Jhcnkgd29ya2Fyb3VuZDoKU2VsZWN0IGtlcm5lbCB2ZXJzaW9uIDUuMS4y
MHggb3Igb2xkZXIgd2hlbiByZXN0YXJ0aW5nLgoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMg
bWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
