Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0E838C832
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 15:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C659E892BD;
	Fri, 21 May 2021 13:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2A6892BD;
 Fri, 21 May 2021 13:33:38 +0000 (UTC)
Date: Fri, 21 May 2021 13:33:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1621604016;
 bh=QNLLlNgSg11HgL3zL5CwEIPYTNM7vhxRcygLmBy/KlU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=E/vVc+1B25XI396wgaGQmly774MA/QKTPuoZhP+21151xdPXNjZPcY+tvsc0YD+Pe
 ZlwEuEeFlRwTgZBe/w9bTOhgs2xJJgawH8Mal0wN8kFoAm1oNEM362GGAOP8IUUat9
 0w9ZVZgJixSi8vb0m5dnYD7dd9j+ckNBMXlUCkIB+zUKNf2n/L+NAGr3143K62Zszv
 oXpbOnhsutoD0ZnxqX3AbX46xN01xSSfRfrAL8aqH0CorwvfYh5HzK3gExGgVOOIwG
 bPPaej/GY+VqB/+vEBgT6T9AE6hnRMfSG111H4yJItHAS0rHh/hoVDjFRTxRQDx+bd
 FiwNcQLM1stnw==
To: lyude@redhat.com
From: Simon Ser <contact@emersion.fr>
Subject: Re: Freenode fallout
Message-ID: <kqrCx-H3bt-9rRccwW7Vw2RGy6V_yvVxOw9-hFZ600mJ8kdC9KVAeWpWGbY1c3FbkLCjQ9HZagowdf_ZtqerRLE_u3bclwYcTad3tb4sxl4=@emersion.fr>
In-Reply-To: <143980f8802d0f7de8b106037acce649e219f575.camel@redhat.com>
References: <143980f8802d0f7de8b106037acce649e219f575.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: xorg-devel <xorg-devel@lists.x.org>,
 "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>,
 "board@x.org" <board@x.org>, members@x.org,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, May 21st, 2021 at 1:49 AM, Lyude Paul <lyude@redhat.com> wrote:

> After considering Libera and OFTC as options, the board settled on
> recommending OFTC. The primary reason for this is because OFTC is
> associated with our parent foundation SPI, and has a long and well known
> history of involvement with the open source community. As well, the
> board believes OFTC's current Governance model is a lot more clear then
> Libera's.

I'd personally prefer Libera Chat. They don't yet have a published
formal governance model, but I hope this will come soon. As the former
Freenode staff, I trust them to make sure mistakes from the past won't
be repeated.

Apart from politics, Libera also offers a more modern feature set. This
can ease daily usage, with features such as reliable authentication,
account tracking, and many other IRC protocol improvements. OFTC has
plans to eventually migrate to Solanum, but they don't have the time to
do it for now.

For reference, on OFTC:

    CAP LS 302
    :kinetic.oftc.net CAP * LS :multi-prefix

And on Libera:

    CAP LS 302
    :ruthenium.libera.chat CAP * LS :account-notify away-notify chghost ext=
ended-join multi-prefix sasl=3DPLAIN,ECDSA-NIST256P-CHALLENGE,EXTERNAL tls =
userhost-in-names account-tag cap-notify echo-message solanum.chat/identify=
-msg solanum.chat/realhost
