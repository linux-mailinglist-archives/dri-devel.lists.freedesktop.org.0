Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 931F03E9A6A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 23:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5F86E1D2;
	Wed, 11 Aug 2021 21:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB9E26E1D2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 21:32:55 +0000 (UTC)
Date: Wed, 11 Aug 2021 21:32:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1628717572;
 bh=gbJfs5+RUbN3b3CLx3SodV8MDyPtO2Tt7gUG1y8hnfw=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=jFzEy1azeGDVG7wVmY3CZI7suaFaNJ9o1xJywcru5E/OVrfIEiwCGhuQpvNW9mo75
 GvHUyl7hhdgoplUadN3STzw/H4F0FPiXLcrWF9SoFNUPGd2OAMWh1oEnQEaAikrkxU
 BVApIEhEPIY8u+OlKrn7lyPTINYzYqrH7Pq8CtLCp2zuxp1jIZaLCVoS/BbFYj0beN
 nuiwU3iWYHMBN4WhA488pBVsS5/gg+NKNGqOlY5SIaqnol2vzof941l5e8ab1KasDp
 65521g1OFInsDiEMjvtKUeJOfByPx5/iICqcRxeC4L3Kmut0CKhFKrc0lpsRycJATA
 PWd1Gg3asu2XQ==
To: Lucas De Marchi <lucas.demarchi@intel.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, airlied@redhat.com
Subject: Re: [PATCH] drm/edid: fix edid field name
Message-ID: <fNYfXtEqPuvThfQgTb62cr8mjJl9SOGfXX02gNF9b0FmpcvY5b-c1EiJrtJQio_j64_0t0EVnOpfkLctibSPbmH2q6YtWbc9Ct3BNqrOnuA=@emersion.fr>
In-Reply-To: <20210811205818.156100-1-lucas.demarchi@intel.com>
References: <20210811205818.156100-1-lucas.demarchi@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>

Do you need me to push this?
