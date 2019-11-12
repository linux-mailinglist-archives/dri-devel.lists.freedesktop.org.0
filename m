Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BFBF8422
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 01:08:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF496EA19;
	Tue, 12 Nov 2019 00:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD8C6EA0E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 00:07:40 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204609] amdgpu: powerplay failed send message
Date: Tue, 12 Nov 2019 00:07:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: guido-kern-bugs@unknownsite.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204609-2300-zrHExJ5vUD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204609-2300@https.bugzilla.kernel.org/>
References: <bug-204609-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ2MDkKCkd1aWRv
IFdpbmtlbG1hbm4gKGd1aWRvLWtlcm4tYnVnc0B1bmtub3duc2l0ZS5kZSkgY2hhbmdlZDoKCiAg
ICAgICAgICAgV2hhdCAgICB8UmVtb3ZlZCAgICAgICAgICAgICAgICAgICAgIHxBZGRlZAotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCiAgICAgICAgICAgICAgICAgQ0N8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHxndWlkby1rZXJuLWJ1Z3NAdW5rbm93bnNpdGUKICAgICAgICAgICAgICAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfC5kZQoKLS0tIENvbW1lbnQgIzIgZnJvbSBHdWlk
byBXaW5rZWxtYW5uIChndWlkby1rZXJuLWJ1Z3NAdW5rbm93bnNpdGUuZGUpIC0tLQpJIGhhdmUg
dmVyeSBzaW1pbGFyIHByb2JsZW1zIHdpdGggS2VybmVsIDUuNC1yYzcuIEluIG15IGNhc2UgaXQn
cyBhIFNhcHBoaXJlCjU3MDBYVCwgYW5kIEkgYW0gdXNpbmcgR2VudG9vIGluc3RlYWQgb2YgVWJ1
bnR1LCBob3dldmVyLCB0aGUgcHJvYmxlbXMgc3RhcnQKd2F5IGJlZm9yZSBhbnkgdXNlcnNwYWNl
IGNvZGUgaXMgbG9hZGVkLgoKSW4gbXkgY2FzZSwgdGhlIHByb2JsZW1zIGNhdXNlIGxvbmcgZGVs
YXlzIG9uIHN5c3RlbSBib290LCBvbmNlIGJlZm9yZSBsb2FkaW5nCmluaXQsIG9uY2Ugd2hpbGUg
WCBpcyBsb2FkaW5nLiBBcyBhIHZlcnkgcm91Z2ggZXN0aW1hdGUsIEkgdGhpbmsgdGhlIGRlbGF5
cwphbW91bnQgdG8gYWJvdXQgMiBtaW51dGVzLiBPbmNlIFggaXMgbG9hZGVkLCBJIGNhbiBubyBs
b25nZXIgc2VlIGFueSBkZWxheXMuCgpBbGwgc2Vuc29ycyBvbiB0aGUgYm9hcmQgYXJlIGNvbXBs
ZXRlbHkgbm9uLWZ1bmN0aW9uYWwuIEhlcmUgaXMgYSBzYW1wbGUgb3V0cHV0CmZyb20gInNlbnNv
cnMiOgoKPT09PT09CmFtZGdwdS1wY2ktMGEwMApBZGFwdGVyOiBQQ0kgYWRhcHRlcgp2ZGRnZng6
ICAgICAgICswLjc1IFYgIApFUlJPUjogQ2FuJ3QgZ2V0IHZhbHVlIG9mIHN1YmZlYXR1cmUgZmFu
MV9pbnB1dDogSS9PIGVycm9yCmZhbjE6ICAgICAgICAgICAgIE4vQSAgKG1pbiA9ICAgIDAgUlBN
LCBtYXggPSAzMjAwIFJQTSkKRVJST1I6IENhbid0IGdldCB2YWx1ZSBvZiBzdWJmZWF0dXJlIHRl
bXAxX2lucHV0OiBJL08gZXJyb3IKZWRnZTogICAgICAgICAgICAgTi9BICAoY3JpdCA9ICsxMTgu
MMKwQywgaHlzdCA9IC0yNzMuMcKwQykKICAgICAgICAgICAgICAgICAgICAgICAoZW1lcmcgPSAr
OTkuMMKwQykKRVJST1I6IENhbid0IGdldCB2YWx1ZSBvZiBzdWJmZWF0dXJlIHRlbXAyX2lucHV0
OiBJL08gZXJyb3IKanVuY3Rpb246ICAgICAgICAgTi9BICAoY3JpdCA9ICs5OS4wwrBDLCBoeXN0
ID0gLTI3My4xwrBDKQogICAgICAgICAgICAgICAgICAgICAgIChlbWVyZyA9ICs5OS4wwrBDKQpF
UlJPUjogQ2FuJ3QgZ2V0IHZhbHVlIG9mIHN1YmZlYXR1cmUgdGVtcDNfaW5wdXQ6IEkvTyBlcnJv
cgptZW06ICAgICAgICAgICAgICBOL0EgIChjcml0ID0gKzk5LjDCsEMsIGh5c3QgPSAtMjczLjHC
sEMpCiAgICAgICAgICAgICAgICAgICAgICAgKGVtZXJnID0gKzk5LjDCsEMpCkVSUk9SOiBDYW4n
dCBnZXQgdmFsdWUgb2Ygc3ViZmVhdHVyZSBwb3dlcjFfYXZlcmFnZTogSS9PIGVycm9yCnBvd2Vy
MTogICAgICAgICAgIE4vQSAgKGNhcCA9IDE5NS4wMCBXKQoKazEwdGVtcC1wY2ktMDBjMwpBZGFw
dGVyOiBQQ0kgYWRhcHRlcgpUZGllOiAgICAgICAgICszMS41wrBDICAoaGlnaCA9ICs3MC4wwrBD
KQpUY3RsOiAgICAgICAgICs0MS41wrBDCj09PT09PQoKSSBkaWQgbm90IGV4cGVyaWVuY2UgYW55
IG9mIHRoZXNlIHByb2JsZW1zIHdpdGggNS4zLjEwLgoKSSBoYXZlIHRocmVlIG1vbml0b3JzIGNv
bm5lY3RlZCB0byB0aGlzIGJvYXJkLCBhbGwgb2YgdGhlbSB2aWEgRGlzcGxheVBvcnQuCgpJIGFt
IGF0dGFjaGluZyBhbm90aGVyIGRtZXNnIGxvZy4KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlz
IG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
