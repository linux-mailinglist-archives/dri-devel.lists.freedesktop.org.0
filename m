Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E0A1FC47A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 05:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3504C6E0FA;
	Wed, 17 Jun 2020 03:11:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 565E96E0FA
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 03:11:17 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 200695] Blank screen on RX 580 with amdgpu.dc=1 enabled (no
 displays detected)
Date: Wed, 17 Jun 2020 03:11:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: virtuousfox@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-200695-2300-M5PoJFDmqF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-200695-2300@https.bugzilla.kernel.org/>
References: <bug-200695-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDA2OTUKCi0tLSBD
b21tZW50ICM0NSBmcm9tIFNlcmdleSBLb25kYWtvdiAodmlydHVvdXNmb3hAZ21haWwuY29tKSAt
LS0KKEluIHJlcGx5IHRvIEFsZXggRGV1Y2hlciBmcm9tIGNvbW1lbnQgIzQ0KQo+IFRoZXJlIGlz
IG5vIHN1cHBvcnQgZm9yIGFuYWxvZyBkaXNwbGF5cyBpbiBEQy4KCldoaWNoIHdhcyBhIGhvcnJp
YmxlIGRlY2lzaW9uLiBMdWNraWx5LCBkZWNlbnQgRFAtPlZHQSBhZGFwdGVycyBhY3R1YWxseSB3
b3JrCmV2ZW4gd2l0aCBwcm9wZXIg4omlMTA4MHAg4omlODVmcHMgQ1JUcy4gQnV0IGl0IHN0aWxs
IGhhcyBzb21lIHByb2JsZW1zIHdpdGggRFZJCnBvcnRzIGFuZC9vciBIRE1JLT5EVkkgYWRhcHRl
cnMgb3IgY2VydGFpbiBtb25pdG9ycy4gU2VlbXMgbXkgaXNzdWUgd2l0aCBubwpvdXRwdXQgYXQg
YWxsIGluIFVFRkkgbW9kZSB3YXMgYSBzZXBhcmF0ZSBvbmUgYW5kIGhhcyB0byBkbyB3aXRoIEJJ
T1MncyBzaWduaW5nCkRSTSBub25zZW5zZS4gSGFja2VkIFZCSU9TIHdvcmtzIGZpbmUgd2l0aCBV
RUZJ4oCmIGlmIHlvdSBkb24ndCBjb3VudCBqdXN0CmluaXRpYWxpemluZyBzb2xlIERQIHBvcnQg
YXQgYm9vdOKApiB3aGljaCBoYXMgYmFja3VwL3NwZWNpYWwtcHVycG9zZSBDUlQKY29ubmVjdGVk
IGFuZCBub3QgcmVhbCBwcmltYXJ5IGRpc3BsYXkgaW4gRFZJLgoKQnV0IGluIGVpdGhlciBtb2Rl
IHdpdGggZGM9MSBpdCBqdXN0IGRvZXNuJ3Qgd2FudCB0byBhY2tub3dsZWRnZSBteSBCRU5RCkcy
MzIwSERCIGNvbm5lY3RlZCB3aXRoIGEgc2ltcGxlIEhETUktPkRWSSBhZGFwdGVyLCBhcyBpZiBp
dCBkb2Vzbid0IGV4aXN0LCBhbmQKdGhlcmUgaXMgbm8gc2Vjb25kIERWSSBwb3J0LiBNYXliZSBI
RENQIHNoZW5hbmlnYW5zID8KClRoZXJlIGlzIGFsc28gYW5vdGhlciBpc3N1ZSB3aXRoIGFtZGdw
dSBmYWlsaW5nIHRvIGluaXRpYWxpemUgYW5kIGhhbmdpbmcKZGlzcGxheSBvdXRwdXQgYXQgYm9v
dCwgaWYgNjQtYml0IFBDSWUgYWRkcmVzc2luZyAoImFib3ZlIDRHIGRlY29kaW5nIikgaXMKZW5h
YmxlZCwgdW5sZXNzIHBjaWU9bm9jcnMgc3BlY2lmaWVkIGZvciBrZXJuZWwgYnV0IHRoYXQncyBh
IHRoaXJkIGlzc3VlIGFuZApsaWtlbHkgaGFzIHRvIGRvIHdpdGggY3JhcHB5IEJJT1Mgb2YgbXkg
bmV3IHVubGljZW5zZWQgTEdBMjAxMSBtb3RoZXJib2FyZAooZXZlbiB0aG91Z2ggaXQgd29ya3Mg
ZmluZSBvbiBXaW5kb3dzKToKYW1kZ3B1OiBbcG93ZXJwbGF5XSAKIGZhaWxlZCB0byBzZW5kIG1l
c3NhZ2UgMjU0IHJldCBpcyAwIAphbWRncHU6IFtwb3dlcnBsYXldIFNNVSBsb2FkIGZpcm13YXJl
IGZhaWxlZAphbWRncHU6IFtwb3dlcnBsYXldIGZ3IGxvYWQgZmFpbGVkCnNtdSBmaXJtd2FyZSBs
b2FkaW5nIGZhaWxlZAphbWRncHUgMDAwMDowMzowMC4wOiBhbWRncHVfZGV2aWNlX2lwX2luaXQg
ZmFpbGVkCmFtZGdwdSAwMDAwOjAzOjAwLjA6IEZhdGFsIGVycm9yIGR1cmluZyBHUFUgaW5pdApb
ZHJtXSBhbWRncHU6IGZpbmlzaGluZyBkZXZpY2UuCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhp
cyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
