Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBC1C085D2
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 02:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79EDD10E22A;
	Fri, 24 Oct 2025 23:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.b="Yab3V6/J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-244104.protonmail.ch (mail-244104.protonmail.ch
 [109.224.244.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECBB10E22A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 23:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1761350389; x=1761609589;
 bh=ldBO7tQYWbPgTdNm6YIuqRQWbQTBWwAShahynqgBBm8=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=Yab3V6/Jg6uriUT5IPy8MAUr94W7U+360ctRxddqYX4nlPMnK4gHiraZrfnOyZ5Os
 vWjrTNt680C7CpBOqXUaYmRA4m8ohPWQ2BSSsosIp/nxvnMHqTAlbvFy+D4+aK480F
 JLVE4ADqG5jrB8Zl45mvPePU73ZueSBji++jhgHDJOc/xsptudmo0w5WU9C6zB4D+3
 Q4LbZPaMv4PmvoKPXzCrkhj1/o3Zpe+uTczGA9CDb7rdoeNC7rRzC6wyCN+k+cjQfd
 FIcfxDkF0QURcyg3GjsUEfxmbVtv61/v7uwj2cdG24OUKSS1GfDsJmp5YENsruZ6T1
 t2qulyDUrSxSg==
Date: Fri, 24 Oct 2025 23:59:46 +0000
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: CS Sushi Man <cssushiman@protonmail.com>
Subject: Question about DRM Framebuffer
Message-ID: <5eleu4aAum_izymZ_c4J9jFGFy8g2vLc1bx8xGjjFemB9At9ESdQP5yK89QdjNxo4V-XsWp_HbFP6A56syEzc9AZ0lNucp0PDDl8rqY8Pk0=@protonmail.com>
Feedback-ID: 93478688:user:proton
X-Pm-Message-ID: 245eec13276993726db0ef428f276c3f05ed004b
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1=_R7sWCl5IVy504fsYHShU4WFw6jeCeYVw5RUKVpuk"
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

--b1=_R7sWCl5IVy504fsYHShU4WFw6jeCeYVw5RUKVpuk
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SW4gdGhlIGNhc2UgdGhhdCBJIHN0YXJ0IHVwIGFuIGFwcGxpY2F0aW9uIGZyb20gdGhlIExpbnV4
IHRlcm1pbmFsLCBjb3VsZCB5b3UgZGV0YWlsIHRoZSBwcm9jZXNzIG9mIGV4cG9zaW5nIGEgZnJh
bWUgYnVmZmVyIGRldmljZS9tZW1vcnkgc3BhY2Ugd2l0aCBsaWJkcm0sIHRoYXQgaXMgZXF1aXZh
bGVudCB0byBmYmRldj8gQW5kIGlmIHBvc3NpYmxlLCBjb3VsZCB5b3UgYWxzbyBwYXNzIG1lIGEg
bGluayB0byBhbiBleGFtcGxlPwoKSSBob3BlIHRoaXMgaXMgdGhlIHJpZ2h0IHBsYWNlIHRvIGFz
ayA6cAoKU2VudCB3aXRoIFtQcm90b24gTWFpbF0oaHR0cHM6Ly9wcm90b24ubWUvbWFpbC9ob21l
KSBzZWN1cmUgZW1haWwu

--b1=_R7sWCl5IVy504fsYHShU4WFw6jeCeYVw5RUKVpuk
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0
cHg7Ij5JbiB0aGUgY2FzZSB0aGF0IEkgc3RhcnQgdXAgYW4gYXBwbGljYXRpb24gZnJvbSB0aGUg
TGludXggdGVybWluYWwsIGNvdWxkIHlvdSBkZXRhaWwgdGhlIHByb2Nlc3Mgb2YgZXhwb3Npbmcg
YSBmcmFtZSBidWZmZXIgZGV2aWNlL21lbW9yeSBzcGFjZSB3aXRoIGxpYmRybSwgdGhhdCBpcyBl
cXVpdmFsZW50IHRvIGZiZGV2PyBBbmQgaWYgcG9zc2libGUsIGNvdWxkIHlvdSBhbHNvIHBhc3Mg
bWUgYSBsaW5rIHRvIGFuIGV4YW1wbGU/PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFy
aWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0cHg7Ij48YnI+PC9kaXY+PGRpdiBzdHlsZT0i
Zm9udC1mYW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0cHg7Ij5JIGhvcGUg
dGhpcyBpcyB0aGUgcmlnaHQgcGxhY2UgdG8gYXNrIDpwPC9kaXY+PGRpdiBzdHlsZT0iZm9udC1m
YW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0cHg7Ij48YnI+PC9kaXY+DQo8
ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTRw
eDsiIGNsYXNzPSJwcm90b25tYWlsX3NpZ25hdHVyZV9ibG9jayI+DQogICAgPGRpdiBjbGFzcz0i
cHJvdG9ubWFpbF9zaWduYXR1cmVfYmxvY2stdXNlciBwcm90b25tYWlsX3NpZ25hdHVyZV9ibG9j
ay1lbXB0eSI+DQogICAgICAgIA0KICAgICAgICAgICAgPC9kaXY+DQogICAgDQogICAgICAgICAg
ICA8ZGl2IGNsYXNzPSJwcm90b25tYWlsX3NpZ25hdHVyZV9ibG9jay1wcm90b24iPg0KICAgICAg
ICBTZW50IHdpdGggPGEgaHJlZj0iaHR0cHM6Ly9wcm90b24ubWUvbWFpbC9ob21lIiB0YXJnZXQ9
Il9ibGFuayI+UHJvdG9uIE1haWw8L2E+IHNlY3VyZSBlbWFpbC4NCiAgICA8L2Rpdj4NCjwvZGl2
Pg0K


--b1=_R7sWCl5IVy504fsYHShU4WFw6jeCeYVw5RUKVpuk--

