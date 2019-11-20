Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 271A1104212
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 18:27:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2486E326;
	Wed, 20 Nov 2019 17:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04516E326
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 17:27:28 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205589] Green screen crash with 3400G
Date: Wed, 20 Nov 2019 17:27:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pkk@spth.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205589-2300-Y4dcpkB86V@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205589-2300@https.bugzilla.kernel.org/>
References: <bug-205589-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDU1ODkKCi0tLSBD
b21tZW50ICMyIGZyb20gcGtrQHNwdGguZGUgLS0tCk91dCBvZiB0aGUgdGhyZWUgTWFuamFybyBy
ZXBvcnRzLCBvbmx5IG9uZSBpcyBhYm91dCB0aGUgMzQwMEcsIHRoZSBvdGhlciB0d28KYXJlIGFi
b3V0IHRoZSAyNDAwRywgYnV0IHRoZSBzeW1wdG9tcyBzZWVtIHRvIGJlIHRoZSBzYW1lLgoKTXkg
ZG1lc2cgb3V0cHV0IGlzIGF0OgoKaHR0cDovL3d3dy5jb2xlY292aXNpb24uZXUvc3R1ZmYvZG1l
c2ctbG9nCgpJbiA1LjIsIEkgZ2V0IHRoZSBncmVlbiBzY3JlZW4gY3Jhc2ggYWJvdXQgNjAlIG9m
IHRoZSB0aW1lIHdoZW4gSSB0cnkgdG8gbG9nCmludG8gWEZDRS4gSW4gNS4zIEkgZ2V0IGl0IG5l
YXJseSBhbHdheXMuCgpJIHVzZWQgYW4gQUdFU0EgMS4wLjAuMyBBQkJBIEJJT1MuCgpJJ2xsIGdl
dCB0aGUgWG9yZyBsb2cgYW5kIHdpbGwgY2hlY2sgd2l0aCBhbiBBR0VTQSAxLjAuMC40IEIgQklP
UyB0b25pZ2h0IG9yCnRvbW9ycm93LgoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBi
ZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
