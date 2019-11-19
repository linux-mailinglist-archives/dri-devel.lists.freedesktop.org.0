Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBC2102B7D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 19:06:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40116E249;
	Tue, 19 Nov 2019 18:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7596E249
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 18:05:58 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205049] garbled graphics
Date: Tue, 19 Nov 2019 18:05:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lechp@onet.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205049-2300-HaXBQQ9VxK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205049-2300@https.bugzilla.kernel.org/>
References: <bug-205049-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUwNDkKCi0tLSBD
b21tZW50ICMxMiBmcm9tIGxlY2hwQG9uZXQucGwgLS0tCklzIGFueW9uZSBhY3R1YWxseSB3b3Jr
aW5nIG9uIHRoaXMgcHJvYmxlbT8KSSBqdXN0IHVwZ3JhZGVkIGZyb20gRmVkb3JhIDMwIHRvIDMx
LCBob3BpbmcgdGhhdCB0aGUgdXBncmFkZSBtaWdodCBpbmNsdWRlCm90aGVyIG1pc2NlbGxhbmVv
dXMgY2hhbmdlcyB0aGF0IGZpeCB0aGUgcHJvYmxlbSwgYnV0IHRoZSBwcm9ibGVtIGlzIEVYQUNU
TFkKVEhFIFNBTUUuCgpOb3RoaW5nIGhhcyBjaGFuZ2VkLiBJJ20gc3RhcnRpbmcgdG8gbG9zZSBt
eSBtaW5kIHdpdGggdGhpcyBjaHJvbmljIGxhY2sgb2YKcHJvZ3Jlc3MuCgpTdXBwb3J0IGZvciB0
aGUgTGVub3ZvIElkZWFwYWQgMzMwIGhhcyBiZWVuIGJlZW4gc2V2ZXJlbHkgYnJva2VuIGZvciBh
dCBsZWFzdAp0aGUgbGFzdCA2LTcga2VybmVsIHZlcnNpb25zIQoKQ2FuIHlvdSBiaXNlY3QgdGhl
IHBlb3BsZSBzdXBwb3NlZGx5IHdvcmtpbmcgb24gdGhlIGtlcm5lbD8/PwoKLS0gCllvdSBhcmUg
cmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25l
ZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
