Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A58D00551
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 23:35:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8219F10E661;
	Wed,  7 Jan 2026 22:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="dl7542Xp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9140810E111;
 Wed,  7 Jan 2026 17:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1767806912; x=1768066112;
 bh=Qj2fYs3gJhfydf16uezC3qPyLcMKDfKf2EsPDnDOFOw=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=dl7542XpCdL7Jp5/Eu1i/ldgYv2evn5v7qFP+7nqbkHO8Gb6FBjPzPU1rRrSSl4mb
 M21430hnRGyWG/3//Z5HTYYF2TNQ9wDg5CtyVrUaOk+zZNb6X1BJbR0UfzI2K/FAYd
 XtG47OSLSA8JV/gpzkf5D+Cc67OygjXgDVWOdv1vHbzm/CCQHrr6jSdoV9lxgxKCZZ
 +fBFgddGZiFeThjLA3vfiHEytiSZJGJoeLiTUJusJSvXD8a/U+YdcTMRh4YItqb9nj
 7KP2btBxBAdjD0Y+SFWcsUfekJIRxR9hRKfkmmm4fve6EoG5Ob6dcgDG6n0A0WQIoO
 CT6LQQO3XaV9A==
Date: Wed, 07 Jan 2026 17:28:28 +0000
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: alliancetrooper <alliancetrooper@proton.me>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: External HDMI monitor fails to wake up from DPMS/consoleblank since
 kernel 6.18
Message-ID: <x22LVmFvTwDrklnrfzto0X8folnEtLitNgQKjJxtTH99P9Bplb8S28jJT74Eqd_9w3jfQepZ5Q62_bIw6DhpzG5iDiTboHr-8B8Ilx3Qjzg=@proton.me>
Feedback-ID: 88488025:user:proton
X-Pm-Message-ID: 9ab3630095f6539bf609c4206c7d09eec8527798
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1=_aLXrvzmwPk682esnm9fwoDMjY9t6ddbisdPlvQQIK30"
X-Mailman-Approved-At: Wed, 07 Jan 2026 22:35:42 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--b1=_aLXrvzmwPk682esnm9fwoDMjY9t6ddbisdPlvQQIK30
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGVsbG8uCgpJIGFtIHJlcG9ydGluZyBhIHJlZ3Jlc3Npb24gaW4gdGhlIGtlcm5lbC4gYW4gZXh0
ZXJuYWwgSERNSSBtb25pdG9yIGZhaWxzIHRvIHdha2UgdXAgZnJvbSBhIGxvdy1wb3dlciBzdGF0
ZS4KVGhlIGlzc3VlIG9jY3VycyBib3RoIGluIHRoZSBWVCBjb25zb2xlICh1c2luZyBjb25zb2xl
YmxhbmsgcGFyYW1ldGVyKSBhbmQgaW4gdGhlIFguT3JnIGdyYXBoaWNhbCBzZXNzaW9uICh1c2lu
ZyB4c2V0IGRwbXMgZm9yY2Ugb2ZmKS4KVGhlIGludGVybmFsIGxhcHRvcCBkaXNwbGF5IHJlc3Vt
ZXMgY29ycmVjdGx5LiBUaGlzIHByb2JsZW0gd2FzIG5vdCBwcmVzZW50IGluIExpbnV4IGtlcm5l
bCA2LjE3LiBJdCBzdGFydGVkIG9jY3VycmluZyBhZnRlciB1cGRhdGluZyB0byBrZXJuZWwgNi4x
OC4wLgpNeSBLZXJuZWw6IDYuMTguMywgYnVpbHQgZnJvbSB2YW5pbGxhIHNvdXJjZXMgaW4gR2Vu
dG9vLiBEaXNwbGF5IGNvbnRyb2xsZXI6IEFkdmFuY2VkIE1pY3JvIERldmljZXMsIEluYy4gW0FN
RC9BVEldIFN0cml4IFtSYWRlb24gODgwTSAvIDg5ME1dIChyZXYgYzQpLgoKTm8gbWVzc2FnZXMg
aW4gZG1lc2cgcmVnYXJkaW5nIHRoaXMuCgpTdGVwcyB0byBSZXByb2R1Y2U6CjEuIENvbm5lY3Qg
YW4gZXh0ZXJuYWwgbW9uaXRvciB2aWEgSERNSS4KMi4gQm9vdCB3aXRoIHRoZSBrZXJuZWwgcGFy
YW1ldGVyIGNvbnNvbGVibGFuaz0zMC4KMy4gV2FpdCAzMCBzZWNvbmRzIGZvciB0aGUgc2NyZWVu
IHRvIGJsYW5rIGFuZCBzb21lIHRpbWUgKG5vIG1vcmUgdGhhbiA1IG1pbnMpIGFkZGl0aW9uYWxs
eS4KNC4gVHJ5IHRvIHdha2UgdGhlIGRpc3BsYXkgYnkgcHJlc3NpbmcgYSBrZXkuIFRoZSBleHRl
cm5hbCBtb25pdG9yIHJlbWFpbnMgb2ZmLCB3aGlsZSB0aGUgaW50ZXJuYWwgbGFwdG9wIGRpc3Bs
YXkgdHVybnMgb24uCjUuIEFsc28gcmVwcm9kdWNpYmxlIGluIFgxMS9Yb3JnIHNlc3Npb24gdXNp
bmcgeHNldCBkcG1zIGZvcmNlIG9mZi4gSXQgaXMgYWxzbyBuZWVkZWQgdG8gc3BlbnQgc29tZSB0
aW1lIGluIG9mZiBzdGF0ZS4KClRoYW5rIHlvdS4=

--b1=_aLXrvzmwPk682esnm9fwoDMjY9t6ddbisdPlvQQIK30
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0
cHg7Ij5IZWxsby48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIHNhbnMtc2Vy
aWY7IGZvbnQtc2l6ZTogMTRweDsiPjxicj48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTog
QXJpYWwsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTRweDsiPkkgYW0gcmVwb3J0aW5nIGEgcmVn
cmVzc2lvbiBpbiB0aGUga2VybmVsLiBhbiBleHRlcm5hbCBIRE1JIG1vbml0b3IgZmFpbHMgdG8g
d2FrZSB1cCBmcm9tIGEgbG93LXBvd2VyIHN0YXRlLjxicj4NClRoZSBpc3N1ZSBvY2N1cnMgYm90
aCBpbiB0aGUgVlQgY29uc29sZSAodXNpbmcgPGNvZGU+Y29uc29sZWJsYW5rPC9jb2RlPiBwYXJh
bWV0ZXIpIGFuZCBpbiB0aGUgWC5PcmcgZ3JhcGhpY2FsIHNlc3Npb24gKHVzaW5nIDxjb2RlPnhz
ZXQgZHBtcyBmb3JjZSBvZmY8L2NvZGU+KS48YnI+VGhlIGludGVybmFsIGxhcHRvcCBkaXNwbGF5
IHJlc3VtZXMgY29ycmVjdGx5LiBUaGlzIHByb2JsZW0gd2FzIG5vdCBwcmVzZW50IGluIExpbnV4
IGtlcm5lbCA2LjE3LiBJdCBzdGFydGVkIG9jY3VycmluZyBhZnRlciB1cGRhdGluZyB0byBrZXJu
ZWwgNi4xOC4wLjxicj4NCk15IEtlcm5lbDogNi4xOC4zLCBidWlsdCBmcm9tIHZhbmlsbGEgc291
cmNlcyBpbiBHZW50b28uIERpc3BsYXkgY29udHJvbGxlcjogQWR2YW5jZWQgTWljcm8gRGV2aWNl
cywgSW5jLiBbQU1EL0FUSV0gU3RyaXggW1JhZGVvbiA4ODBNIC8gODkwTV0gKHJldiBjNCkuPGJy
Pg0KPGJyPg0KTm8gbWVzc2FnZXMgaW4gZG1lc2cgcmVnYXJkaW5nIHRoaXMuPGJyPg0KPGJyPg0K
U3RlcHMgdG8gUmVwcm9kdWNlOjxicj4NCjEuICZuYnNwO0Nvbm5lY3QgYW4gZXh0ZXJuYWwgbW9u
aXRvciB2aWEgSERNSS48YnI+DQoyLiAmbmJzcDtCb290IHdpdGggdGhlIGtlcm5lbCBwYXJhbWV0
ZXIgPGNvZGU+Y29uc29sZWJsYW5rPTMwPC9jb2RlPi48YnI+DQozLiAmbmJzcDtXYWl0IDMwIHNl
Y29uZHMgZm9yIHRoZSBzY3JlZW4gdG8gYmxhbmsgYW5kIHNvbWUgdGltZSAobm8gbW9yZSB0aGFu
IDUgbWlucykgYWRkaXRpb25hbGx5Ljxicj4NCjQuICZuYnNwO1RyeSB0byB3YWtlIHRoZSBkaXNw
bGF5IGJ5IHByZXNzaW5nIGEga2V5LiBUaGUgZXh0ZXJuYWwgbW9uaXRvciByZW1haW5zIG9mZiwg
d2hpbGUgdGhlIGludGVybmFsIGxhcHRvcCBkaXNwbGF5IHR1cm5zIG9uLjxicj4NCjUuICZuYnNw
O0Fsc28gcmVwcm9kdWNpYmxlIGluIFgxMS9Yb3JnIHNlc3Npb24gdXNpbmcgPGNvZGU+eHNldCBk
cG1zIGZvcmNlIG9mZjwvY29kZT4uIEl0IGlzIGFsc28gbmVlZGVkIHRvIHNwZW50IHNvbWUgdGlt
ZSBpbiBvZmYgc3RhdGUuPGJyPg0KPGJyPg0KVGhhbmsgeW91LjwvZGl2Pg==


--b1=_aLXrvzmwPk682esnm9fwoDMjY9t6ddbisdPlvQQIK30--

