Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A29CB217E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 15:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92696F3BD;
	Fri, 13 Sep 2019 13:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 595 seconds by postgrey-1.36 at gabe;
 Fri, 13 Sep 2019 13:59:26 UTC
Received: from mail.linuxsystems.it (mail.linuxsystems.it [79.7.78.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F39C36F3BD
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 13:59:26 +0000 (UTC)
Received: by mail.linuxsystems.it (Postfix, from userid 33)
 id 87C7720BB8D; Fri, 13 Sep 2019 15:43:42 +0200 (CEST)
To: dri-devel@lists.freedesktop.org
Subject: Running SPICE on ppc64le
X-PHP-Originating-Script: 0:rcube.php
MIME-Version: 1.0
Date: Fri, 13 Sep 2019 15:43:42 +0200
From: =?UTF-8?Q?Niccol=C3=B2_Belli?= <darkbasic@linuxsystems.it>
Message-ID: <4f96ca2df5c0a67c6f5cb89ff759e93d@linuxsystems.it>
X-Sender: darkbasic@linuxsystems.it
User-Agent: Roundcube Webmail/1.1.5
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=linuxsystems.it; 
 s=linuxsystems.it; t=1568382222;
 bh=OwH3U0Cex0v+gKQbBN77dNDF14xLlIPzHQefCYGOza4=;
 h=To:Subject:Date:From:From;
 b=X6HLervjsw9g7VD7sQXh90aVSh72HumWVQXjaQMKuRaVNz/qA6Q+291DmojglOsOZ
 4HKt6gfsrPxXNdIdx/NSOz1EtYrg0LxSK/ijo3fLXM03Tvi678sgNX93s0WyUTZ7i/
 SfRCNLYMucdGaIMcoCc2lv0m6s9JqLCWugrpj9SY=
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCklzIHRoZXJlIGFueSByZWFzb24gd2h5IFNwaWNlIGlzIG5vdCBhdmFpbGFibGUgb24gcHBj
NjRsZT8KSSd2ZSByZWFkIHRoZXJlIGFyZSBzdGlsbCBzb21lIGlzc3VlcyB3aXRoIGJpZyBlbmRp
YW4sIGJ1dCB3aGF0J3Mgd3JvbmcgCndpdGggbGl0dGxlIGVuZGlhbj8KSSB3b3VsZCByZWFsbHkg
bG92ZSB0byBiZSBhYmxlIHRvIHVzZSBRWEwgYW5kIGVzcGVjaWFsbHkgVVNCIHJlZGlyZWN0aW9u
IApvbiBteSBSYXB0b3IgQmxhY2tiaXJkIChQb3dlciA5KS4KCkJlc3RzLApOaWNjb2xvJwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
