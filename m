Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 060E51408E
	for <lists+dri-devel@lfdr.de>; Sun,  5 May 2019 17:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F15DC89306;
	Sun,  5 May 2019 15:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100F389306
 for <dri-devel@lists.freedesktop.org>; Sun,  5 May 2019 15:18:53 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id A17B828627
 for <dri-devel@lists.freedesktop.org>; Sun,  5 May 2019 15:18:52 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 95BA628632; Sun,  5 May 2019 15:18:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201847] nouveau 0000:01:00.0: fifo: fault 01 [WRITE] at
 000000000a721000 engine 00 [GR] client 0f [GPC0/PROP_0] reason 82 [] on
 channel 4 [00ff85c000 X[3819]]
Date: Sun, 05 May 2019 15:18:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kernel.org@marc.ngoe.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201847-2300-0FcyuxDGtt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201847-2300@https.bugzilla.kernel.org/>
References: <bug-201847-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDE4NDcKCi0tLSBD
b21tZW50ICMxIGZyb20gTWFyYyBCLiAoa2VybmVsLm9yZ0BtYXJjLm5nb2UuZGUpIC0tLQpJdCB3
b3VsZCBiZSBzb29vbyBjb29sIGlmIGFueW9uZSB3b3VsZCBhY3R1YWxseSByZWFkIHRoaXMgYnVn
IHJlcG9ydCBhbmQgbWF5YmUKdHJ5IHRvIGZpeCBpdC4gSSB3aWxsIGFzc2lzdCBpbiB0ZXN0aW5n
IHBhdGNoZXMgdW50aWwgdGhpcyBpcyByZXNvbHZlZC4KCkFuZDogSSBhbSB3aWxsaW5nIHRvIG9m
ZmVyICQxMDAgZm9yIGZpeGluZyB0aGlzIGFubm95aW5nIGJ1ZyEgS2VlcHMgZnJlZXppbmcgbXkK
NC4xOS4zOSBrZXJuZWwgb3V0IG9mIG5vd2hlcmUuCgpTb21lIHRoaW5ncyBJIHdvdWxkIGxpa2Ug
dG8gZ2V0IGludG8gZGlzY3Vzc2lvbjoKCmEpIC0gaXQgbWlnaHQgaGF2ZSBzb21ldGhpbmcgdG8g
ZG8gd2l0aCBtZW1vcnkgcHJlc3N1cmUKCl9hbmRfCgpiKQotIGhpZ2ggQ1BVIGxvYWQKX29yXwot
IGhpZ2ggbnVtYmVyIG9mIGNvbnRleHQgc3dpdGNoZXMuCgpGb3IgdGhlIGxhdHRlciBJJ20gbm90
IHN1cmUuIFRoZSBidWcgYWN0dWFsbHkgYWx3YXlzIG9jY3VycyB3aGVuIEkgaWUuIGNvbXBpbGUK
dHdvIGtlcm5lbHMgYXQgLWoyNCBhbmQgaGFiZSBzb21lIG90aGVyIHdvcmsgYmVzaWRlcyB0aGlz
LCBzYXkgYSBZVCB2aWRlby4gVGhlCmJ1ZyBpcywgaG93ZXZlciwgZGVmaW5pdGVseSB0cmlnZ2Vy
ZWQgYnkgYSBncmFwaGljcyBldmVudCwgaWUuCnJlc2l6aW5nL2NyZWF0aW5nIGEgd2luZG93LCBz
Y3JvbGxpbmcgYSBXZWIgcGFnZSBvciB3YXRjaGluZyBhIHZpZGVvLgoKClsyMDE5LTA1LTA0IDE1
OjQzOjI0XSBlcnIga2VybiAwMyBrZXJuZWwgOiBbICA1MjMuOTA2NDU5XSBub3V2ZWF1IDAwMDA6
MDE6MDAuMDoKZmlmbzogU0NIRURfRVJST1IgMGEgW0NUWFNXX1RJTUVPVVRdClsyMDE5LTA1LTA0
IDE1OjQzOjI0XSBub3RpY2Uga2VybiAwNSBrZXJuZWwgOiBbICA1MjMuOTA2NDY3XSBub3V2ZWF1
CjAwMDA6MDE6MDAuMDogZmlmbzogcnVubGlzdCAwOiBzY2hlZHVsZWQgZm9yIHJlY292ZXJ5Clsy
MDE5LTA1LTA0IDE1OjQzOjI0XSBub3RpY2Uga2VybiAwNSBrZXJuZWwgOiBbICA1MjMuOTA2NDcz
XSBub3V2ZWF1CjAwMDA6MDE6MDAuMDogZmlmbzogY2hhbm5lbCAyOiBraWxsZWQKWzIwMTktMDUt
MDQgMTU6NDM6MjRdIG5vdGljZSBrZXJuIDA1IGtlcm5lbCA6IFsgIDUyMy45MDY0NzldIG5vdXZl
YXUKMDAwMDowMTowMC4wOiBmaWZvOiBlbmdpbmUgMDogc2NoZWR1bGVkIGZvciByZWNvdmVyeQpb
MjAxOS0wNS0wNCAxNTo0MzoyNF0gd2FybmluZyBrZXJuIDA0IGtlcm5lbCA6IFsgIDUyMy45MDY3
ODldIG5vdXZlYXUKMDAwMDowMTowMC4wOiBYWzgwMDZdOiBjaGFubmVsIDIga2lsbGVkIQpbMjAx
OS0wNS0wNCAxNTo0MzoyNF0gZXJyIGtlcm4gMDMga2VybmVsIDogbm91dmVhdSAwMDAwOjAxOjAw
LjA6IGZpZm86ClNDSEVEX0VSUk9SIDBhIFtDVFhTV19USU1FT1VUXQpbMjAxOS0wNS0wNCAxNTo0
MzoyNF0gbm90aWNlIGtlcm4gMDUga2VybmVsIDogbm91dmVhdSAwMDAwOjAxOjAwLjA6IGZpZm86
CnJ1bmxpc3QgMDogc2NoZWR1bGVkIGZvciByZWNvdmVyeQpbMjAxOS0wNS0wNCAxNTo0MzoyNF0g
bm90aWNlIGtlcm4gMDUga2VybmVsIDogbm91dmVhdSAwMDAwOjAxOjAwLjA6IGZpZm86CmNoYW5u
ZWwgMjoga2lsbGVkClsyMDE5LTA1LTA0IDE1OjQzOjI0XSBub3RpY2Uga2VybiAwNSBrZXJuZWwg
OiBub3V2ZWF1IDAwMDA6MDE6MDAuMDogZmlmbzoKZW5naW5lIDA6IHNjaGVkdWxlZCBmb3IgcmVj
b3ZlcnkKWzIwMTktMDUtMDQgMTU6NDM6MjRdIHdhcm5pbmcga2VybiAwNCBrZXJuZWwgOiBub3V2
ZWF1IDAwMDA6MDE6MDAuMDogWFs4MDA2XToKY2hhbm5lbCAyIGtpbGxlZCEKWzIwMTktMDUtMDQg
MTU6NDQ6MjRdIGluZm8ga2VybiAwNiBrZXJuZWwgOiBbICA1ODQuMTIxMzMxXSBzeXNycTogU3lz
UnEgOgpLZXlib2FyZCBtb2RlIHNldCB0byBzeXN0ZW0gZGVmYXVsdApbMjAxOS0wNS0wNCAxNTo0
NDoyNF0gaW5mbyBrZXJuIDA2IGtlcm5lbCA6IHN5c3JxOiBTeXNScSA6IEtleWJvYXJkIG1vZGUg
c2V0IHRvCnN5c3RlbSBkZWZhdWx0CgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJl
Y2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
