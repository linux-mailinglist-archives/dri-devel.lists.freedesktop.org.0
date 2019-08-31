Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F2EA45A6
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2019 19:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7526E148;
	Sat, 31 Aug 2019 17:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310666E148
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2019 17:58:31 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204725] black screen
Date: Sat, 31 Aug 2019 17:58:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: untaintableangel@hotmail.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204725-2300-X0BLYJH5sj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204725-2300@https.bugzilla.kernel.org/>
References: <bug-204725-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ3MjUKCkFudCAo
dW50YWludGFibGVhbmdlbEBob3RtYWlsLmNvLnVrKSBjaGFuZ2VkOgoKICAgICAgICAgICBXaGF0
ICAgIHxSZW1vdmVkICAgICAgICAgICAgICAgICAgICAgfEFkZGVkCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KICAgICAgICAgICAgICAgICBDQ3wgICAgICAgICAgICAgICAgICAgICAgICAgICAgfHVudGFp
bnRhYmxlYW5nZWxAaG90bWFpbC5jbwogICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8LnVrCgotLS0gQ29tbWVudCAjOSBmcm9tIEFudCAodW50YWludGFibGVh
bmdlbEBob3RtYWlsLmNvLnVrKSAtLS0KSWYgaXQncyBhbnkgaGVscCwgSSBoYWQgYSBsb29rIGF0
IHlvdXIgLmNvbmZpZyBhbmQgbm90aWNlZCB5b3UndmUgZ290IHRoZSByaWdodApuYXZpMTAgZmly
bXdhcmUgY29tcGlsZWQgaW4gKGhvd2V2ZXIgeW91J3ZlIHJlcGVhdGVkIGFtZGdwdS9uYXZpMTBf
cGZwLmJpbiBhbmQKYW1kZ3B1L25hdmkxMF9ybGMuYmluIGVudHJpZXMgLSBtdWNoIGVhc2llciB0
byB1c2UgdGhpcyBlbnRyeSB3aGljaCBpbmNsdWRlcwp0aGVtIGFsbDogCgphbWRncHUvbmF2aTEw
X3thc2QsY2UsZ3B1X2luZm8sbWUsbWVjMixtZWMscGZwLHJsYyxzZG1hMSxzZG1hLHNtYyxzb3Ms
dmNufS5iaW4KCllvdSd2ZSBnb3QgeW91ciBmaXJtd2FyZSBjb21waWxlZCBpbiwgYnV0IHRoaXMg
aXMgb25seSBuZWNlc3NhcnkgaWYgeW91J3ZlIGdvdAphbWRncHUgY29tcGlsZWQgaW4gKFkpLiBJ
ZiAnYW1kZ3B1JyBpcyBsZWZ0IGFzIGEgbW9kdWxlIChNKSwgaXQgd2lsbCBodW50IG91dAp5b3Vy
IGZpcm13YXJlIGZpbGVzIGluIC9saWIvZmlybXdhcmUgYnkgaXRzZWxmIG9uIHRoZSBmbHkgdG8g
c3RhcnQuCgpZb3UndmUgZ290IGFtZGdwdSBhcyBhIG1vZHVsZSAoTSkgaW4geW91ciAuY29uZmln
IGJ1dCBpdCdzIG5vdCBiZWluZyBsb2FkZWQKd2hlbiB5b3UgY2hlY2sgd2l0aCBsc21vZCwgc28g
SSdtIGxlZnQgd29uZGVyaW5nIGlmIHlvdSd2ZSBnb3QgYSBjb25maWcgZmlsZQpzb21ld2hlcmUg
YmxhY2tsaXN0aW5nIGl0IG9yIHRlbGxpbmcgc29tZXRoaW5nIGVsc2UgdG8gYmUgdXNlZC4KCmNv
dWxkIHlvdSBwb3N0IHRoZSBvdXRwdXQgb2Y6CmxzIC9ldGMvWDExL3hvcmcuY29uZi5kLwoKYW5k
CgpscyAvdXNyL2xvY2FsL3NoYXJlL1gxMS94b3JnLmNvbmYuZC8KCnRvIHNlZSBpZiB0aGVyZSBh
cmUgYW55IHN1Y2ggY29uZmlnIGZpbGVzLiBZb3VyICJYb3JnLjAubG9nIiB3aWxsIGFsc28gb2Zm
ZXIKY2x1ZXMgYWJvdXQgd2hhdCBpcyBoYXBwZW5pbmcuCmUuZy4gSWYgeW91IGhhZCBhbiBvbGRl
ciBBTUQgZ3B1IGluIHRoZSBwYXN0IHRoYXQgd2FzIHNldCB0byB1c2UgdGhlICdyYWRlb24nCm1v
ZHVsZSwgYW5kIGl0IHdhcyBsb29raW5nIGZvciB0aGlzLCByZWFsaXNpbmcgdGhpcyBtb2R1bGUg
ZG9lc24ndCBzdXBwb3J0IHlvdXIKY2FyZCwgdGhlbiBmYWxsaW5nIGJhY2sgdG8gdmVzYS4KCkFz
IHlvdSdyZSBjb21meSBjb21waWxpbmcgeW91ciBvd24ga2VybmVsLCBJIHN1c3BlY3QgdGhhdCBp
ZiB5b3UgY29tcGlsZSBhbWRncHUKaW50byB5b3VyIGtlcm5lbCB3aXRoIFkgaW5zdGVhZCBvZiBN
LCBpdCBtYXkgaW5hZHZlcnRlbnRseSBmb3JjZSB0aGF0IHRvIGJlCmRlZmFjdG8gZm9yIHRoZSBk
aXNwbGF5IGFib3ZlIG90aGVyIG9wdGlvbnMuCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBt
YWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
