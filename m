Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A116F21328
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 06:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7062D89811;
	Fri, 17 May 2019 04:39:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04F889811
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 04:39:19 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 8CD5A200DF
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 04:39:18 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 786BB2018F; Fri, 17 May 2019 04:39:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203627] New: [Regression] Boot fails with linux-firmware 20190514
Date: Fri, 17 May 2019 04:39:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mezin.alexander@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-203627-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDM2MjcKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjAzNjI3CiAgICAgICAgICAgU3VtbWFyeTogW1JlZ3Jlc3Npb25dIEJv
b3QgZmFpbHMgd2l0aCBsaW51eC1maXJtd2FyZSAyMDE5MDUxNAogICAgICAgICAgIFByb2R1Y3Q6
IERyaXZlcnMKICAgICAgICAgICBWZXJzaW9uOiAyLjUKICAgIEtlcm5lbCBWZXJzaW9uOiA0LjE5
LjQ0CiAgICAgICAgICBIYXJkd2FyZTogQWxsCiAgICAgICAgICAgICAgICBPUzogTGludXgKICAg
ICAgICAgICAgICBUcmVlOiBNYWlubGluZQogICAgICAgICAgICBTdGF0dXM6IE5FVwogICAgICAg
ICAgU2V2ZXJpdHk6IG5vcm1hbAogICAgICAgICAgUHJpb3JpdHk6IFAxCiAgICAgICAgIENvbXBv
bmVudDogVmlkZW8oRFJJIC0gbm9uIEludGVsKQogICAgICAgICAgQXNzaWduZWU6IGRyaXZlcnNf
dmlkZW8tZHJpQGtlcm5lbC1idWdzLm9zZGwub3JnCiAgICAgICAgICBSZXBvcnRlcjogbWV6aW4u
YWxleGFuZGVyQGdtYWlsLmNvbQogICAgICAgIFJlZ3Jlc3Npb246IE5vCgpBZnRlciBjb21taXQK
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZmlybXdhcmUv
bGludXgtZmlybXdhcmUuZ2l0L2NvbW1pdC8/aWQ9MjU3OTE2NzU0OGJlMzNhZmIxZmUyYTlhNWMx
NDE1NjFlZTVhOGJiZQpzeXN0ZW0gZG9lc24ndCBib290IGFueW1vcmUgd2l0aCBrZXJuZWxzIDQu
MTkueCAoYXQgbGVhc3QgNC4xOS40MCBhbmQgNC4xOS40NCkuCjUuMSBib290cyBmaW5lLgoKRGlz
cGxheXMgdHVybiBvZmYgZWFybHkgd2hlbiBhbWRncHUgZHJpdmVyIGxvYWRzLCBuZXZlciB0dXJu
IG9uIGFnYWluLiBDYW4ndApyZWFjaCB0aGUgc3lzdGVtIG92ZXIgc3NoLiBBbHNvIGNhbid0IGdl
dCBhbnkgbG9ncyBmcm9tIGpvdXJuYWxkICh0aGF0IGJvb3QKYXR0ZW1wdCBqdXN0IGRvZXNuJ3Qg
Z2V0IHJlY29yZGVkKQoKR1BVOiBSWCBWZWdhIDY0IChTYXBwaGlyZSBOaXRybyspCkR1YWwgNEsg
ZGlzcGxheXMgY29ubmVjdGVkIG92ZXIgRGlzcGxheVBvcnQKCi0tIApZb3UgYXJlIHJlY2Vpdmlu
ZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhl
IGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
