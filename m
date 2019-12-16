Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81083121EDA
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 00:22:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05626E853;
	Mon, 16 Dec 2019 23:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A7C6E853
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 23:22:38 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204609] amdgpu: powerplay failed send message
Date: Mon, 16 Dec 2019 23:22:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: spaz16@wp.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-204609-2300-3CO3VEjS6q@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204609-2300@https.bugzilla.kernel.org/>
References: <bug-204609-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ2MDkKCkLFgmHF
vGVqIFN6Y3p5Z2llxYIgKHNwYXoxNkB3cC5wbCkgY2hhbmdlZDoKCiAgICAgICAgICAgV2hhdCAg
ICB8UmVtb3ZlZCAgICAgICAgICAgICAgICAgICAgIHxBZGRlZAotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CiAgICAgICAgICAgICAgICAgQ0N8ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHxzcGF6MTZA
d3AucGwKCi0tLSBDb21tZW50ICM1IGZyb20gQsWCYcW8ZWogU3pjenlnaWXFgiAoc3BhejE2QHdw
LnBsKSAtLS0KQ3JlYXRlZCBhdHRhY2htZW50IDI4NjMyOQogIC0tPiBodHRwczovL2J1Z3ppbGxh
Lmtlcm5lbC5vcmcvYXR0YWNobWVudC5jZ2k/aWQ9Mjg2MzI5JmFjdGlvbj1lZGl0Cmtlcm5lbDUu
NCBwb3dlcnBsYXkgYWRkIG11dGV4CgpBbHNvIHRoZSBzYW1lIGFzOiBodHRwczovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvZHJtL2FtZC9pc3N1ZXMvOTAwCgpJbiBrZXJuZWwgNS40LjMgcnVuIGEg
ZmV3IHRpbWVzIGB3YXRjaCAtbiAwLjEgY2F0Ci9zeXMvY2xhc3MvZHJtL2NhcmQwL2RldmljZS9o
d21vbi9od21vbiovZmFuMV9pbnB1dGAgaW4gcGFyYWxsZWwgYW5kIHlvdSdsbApoYXZlIGEgbG90
IG9mIHdhcm5pbmcgYW5kIGZpbmFsbHkgc3lzdGVtIGZyZWV6ZS4KCkluIGtlcm5lbCA1LjUtcmMy
IHBvd2VycGxheSB3YXJuaW5ncyBhbmQgZmluYWxseSBzeXN0ZW0gZnJlZXplIGNhbiBoYXBwZW4g
d2hlbgpzZW5zb3JzIGFyZSByZWFkIGFuZCBzY3JlZW4gbW9kZSBpcyBjaGFuZ2VkIChsaWtlIHNj
cmVlbiByZXNvbHV0aW9uIGNoYW5nZSwKZXRjKS4KCkluIG15IG9waW5pb24gYSBsb3Qgb2YgcG93
ZXJwbGF5IGlzc3VlcyBhcmUgY2F1c2VkIGJ5IG1pc3NpbmcgbXV0ZXhlcyBiZXR3ZWVuCmtlcm5l
bCBhbmQgdXNlciBzcGFjZS4gSSBwcmVwYXJlZCBhIHZlcnkgc2ltcGxlIGtlcm5lbCA1LjQgcGF0
Y2ggd2hpY2ggYWxsb3dzCm1lIHRvIHVzZSBmYW4gbW9uaXRvciwgYnV0IHByb2JhYmx5IHRoZXJl
IGFyZSBzdGlsbCBzb21lIG1pc3NpbmcgbXV0ZXhlcyB0aGVyZS4KCi0tIApZb3UgYXJlIHJlY2Vp
dmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2Yg
dGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
