Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F32FF1A4AE8
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 22:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9DC6ED43;
	Fri, 10 Apr 2020 20:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9266ED43
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 20:09:48 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201139] amdgpu: [drm] enabling link 1 failed: 15 (vega)
Date: Fri, 10 Apr 2020 20:09:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ct.kernel.org@pipapo.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-201139-2300-LR8pqdeV83@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201139-2300@https.bugzilla.kernel.org/>
References: <bug-201139-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDExMzkKCkNocmlz
dGlhbiBUaMOkdGVyIChjdC5rZXJuZWwub3JnQHBpcGFwby5vcmcpIGNoYW5nZWQ6CgogICAgICAg
ICAgIFdoYXQgICAgfFJlbW92ZWQgICAgICAgICAgICAgICAgICAgICB8QWRkZWQKLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQogICAgICAgICAgICAgICAgIENDfCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8Y3Qua2VybmVsLm9yZ0BwaXBhcG8ub3JnCgotLS0gQ29tbWVudCAjMTAgZnJvbSBDaHJpc3Rp
YW4gVGjDpHRlciAoY3Qua2VybmVsLm9yZ0BwaXBhcG8ub3JnKSAtLS0KQ3JlYXRlZCBhdHRhY2ht
ZW50IDI4ODMzNQogIC0tPiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvYXR0YWNobWVudC5j
Z2k/aWQ9Mjg4MzM1JmFjdGlvbj1lZGl0CkZ1cnRoZXIgaW5mbywga2VybmVsIGxvZwoKSSBoYWQg
c29tZSBoYXJkIGNyYXNoZXMgcmVjZW50bHkgKHNjcmVlbiBmcm96ZW4gb3IgYmxhbmspLCBzb21l
dGltZXMgYXMgbXVjaCBhcwpvbmNlIGEgZGF5LCBzb21ldGltZXMgdGhlIFN5c3RlbSBydW5zIGZv
ciBkYXlzIHRvIHdlZWtzLgoKVG9kYXkgb25lIHNjcmVlbiBkaWRuJ3QgY29tZSB1cCBhZnRlciBJ
IHR1cm5lZCBpdCBvbiBhbmQgaSBmb3VuZCBhIHNtb2tpbmcgZ3VuCmluIHRoZSBhdHRhY2hlZCBk
bWVzZy4gTWF5YmUgdGhhdHMgaGVscGZ1bC4KClN5c3RlbSBpcyBBTUQgUnl6ZW4gMTcwMCwgRGVi
aWFuIEJ1c3Rlciwgc2VsZiBidWlsdCBLZXJuZWwuCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhp
cyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
