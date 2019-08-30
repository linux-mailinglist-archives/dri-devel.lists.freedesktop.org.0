Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 023DEA3BF5
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 18:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD2888249;
	Fri, 30 Aug 2019 16:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD92888249
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 16:27:01 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204725] black screen
Date: Fri, 30 Aug 2019 16:27:01 +0000
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
Message-ID: <bug-204725-2300-s5gAYHVGoH@https.bugzilla.kernel.org/>
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
b21tZW50ICM2IGZyb20gRG1pdHJpIFNlbGV0c2tpIChkcmpvbXNAZ21haWwuY29tKSAtLS0KVGhh
bmsgeW91IHZlcnkgbXVjaCBmb3IgeW91ciByZXNwb25zZS4KCkJvdGggdmFsdWVzIGFyZSBzZXQu
CgpJIGFsc28gYXR0YWNoZWQgLmNvbmZpZyBmaWxlIHRvIHRoZSBidWd6aWxsYSByZXBvcnQgYXQg
dGhlIHRpbWUgb2bCoCAKcmVwb3J0aW5nIHByb2JsZW0uCgoKKG5vbmUpZGlta28ncyBEZXNrdG9w
IC91c3Ivc3JjL2xpbnV4ICMgZ3JlcCBDT05GSUdfRFJNX0FNRF9EQ19EQ04yXzAgCi91c3Ivc3Jj
L2xpbnV4Ly5jb25maWcKQ09ORklHX0RSTV9BTURfRENfRENOMl8wPXkKKG5vbmUpZGlta28ncyBE
ZXNrdG9wIC91c3Ivc3JjL2xpbnV4ICMgZ3JlcCAKQ09ORklHX0RSTV9BTURfRENfRFNDX1NVUFBP
UlQgL3Vzci9zcmMvbGludXgvLmNvbmZpZwpDT05GSUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9SVD15
CgoKQW55IG90aGVyIGlkZWFzIHBsZWFzZT8KCgpLaW5kIFJlZ2FyZHMKCkRtaXRyaQoKCk9uIDI5
LzA4LzIwMTkgMDM6MzYsIGJ1Z3ppbGxhLWRhZW1vbkBidWd6aWxsYS5rZXJuZWwub3JnIHdyb3Rl
Ogo+IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjA0NzI1Cj4K
PiBBbGV4IERldWNoZXIgKGFsZXhkZXVjaGVyQGdtYWlsLmNvbSkgY2hhbmdlZDoKPgo+ICAgICAg
ICAgICAgIFdoYXQgICAgfFJlbW92ZWQgICAgICAgICAgICAgICAgICAgICB8QWRkZWQKPiAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4gICAgICAgICAgICAgICAgICAgQ0N8ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHxhbGV4ZGV1Y2hlckBnbWFpbC5jb20KPgo+IC0tLSBDb21tZW50ICM1IGZyb20g
QWxleCBEZXVjaGVyIChhbGV4ZGV1Y2hlckBnbWFpbC5jb20pIC0tLQo+IE1ha2Ugc3VyZSB5b3Vy
IGNvbmZpZyBjb250YWluczoKPiBDT05GSUdfRFJNX0FNRF9EQ19EQ04yXzA9eQo+IENPTkZJR19E
Uk1fQU1EX0RDX0RTQ19TVVBQT1JUPXkKPgoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFp
bCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
