Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AE1A4650
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2019 23:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB9389823;
	Sat, 31 Aug 2019 21:09:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E389B89823
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2019 21:09:45 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204725] black screen
Date: Sat, 31 Aug 2019 21:09:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: drjoms@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204725-2300-QZ8ZmnYpNS@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ3MjUKCi0tLSBD
b21tZW50ICMxOSBmcm9tIERtaXRyaSBTZWxldHNraSAoZHJqb21zQGdtYWlsLmNvbSkgLS0tCnNp
bmNlIG15IHhvcmcgY29uZmlnIGRpcmVjdG9yeSBpcyBpbiBkaWZmZXJlbnQgcGxhY2UgSSBjcmVh
dGVkIGJyYW5kIG5ldyBmaWxlOgoKL2V0Yy9YMTEveG9yZy5jb25mLmQvMTAtYW1kZ3B1LmNvbmYK
CmFuZCBwdXQ6CgpTZWN0aW9uICJPdXRwdXRDbGFzcyIKICAgICAgICBJZGVudGlmaWVyICJBTURn
cHUiCiAgICAgICAgTWF0Y2hEcml2ZXIgImFtZGdwdSIKICAgICAgICBEcml2ZXIgImFtZGdwdSIK
RW5kU2VjdGlvbgoKCgoKbm93IGluIHRoYXQgY29uZmlnIGRpcmVjdG9yeSBpIGhhdmUgdHdvIG9s
ZCBmaWxlcyBJIGhhdmUgYWxyZWFkeSBzaG93biB5b3UgYW5kCm5ldyBvbmUgd2l0aCB0aG9zZSA1
IGxpbmVzIGFib3ZlOgoKKG5vbmUpZGlta28ncyBEZXNrdG9wIC9ob21lL2RpbWtvICMgbHMgIC9l
dGMvWDExL3hvcmcuY29uZi5kLwowMC1rZXlib2FyZC5jb25mICAxMC1hbWRncHUuY29uZiAgMTAt
YW1kZ3B1LmNvbmZ+ICAyMG9wZW5nbC5jb25mCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBt
YWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
