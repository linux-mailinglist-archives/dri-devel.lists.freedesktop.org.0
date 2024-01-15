Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC14082D88B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 12:46:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5629C10E27F;
	Mon, 15 Jan 2024 11:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE40810E27F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 11:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1705319210; x=1705578410;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=aDTtuP1+iQeUlBHoSI9w0f+MIxjTRwixtOoPE7Gxu7ElQWKf7z+oltvhohON9sSyC
 QLrl8sVeUJ0zAsI/udr8ylclIZqoxTS/+ZMHTpgk/tFcc0ovG4h272JAnDgq5jVF6O
 ayqFNGUg4U3wfagp1XTarEKXmFyhrIfrGv9JLlAXeS9KKU9Riq49MYIRHN3YMB14TR
 KM7fRutyxVvscAGoKQtYB+QIHl9ymj47TnI8lV7k/lgO3GAVJ9JkdFVBDWeWVEWnr4
 oyP+KM5e+LU3kswUzhKmBdeijdUq/IIOrtKvXvfowc11L/D0yYPHtR3uBaZZIf8y7C
 sOlD17Zx7aceg==
Date: Mon, 15 Jan 2024 11:46:37 +0000
To: Thomas Zimmermann <tzimmermann@suse.de>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] Documentation/gpu: Reference articles on Linux graphics
 stack
Message-ID: <5TmDVDH1oAzfjHBIixotJqZi2HCO96yZWVoxOMxJzN2WjPAqQ_sH8Ze7o81bncRk9FuUuzp4kpZXmQJpcA9M60bvFC2rzCjTMzeDRGndews=@emersion.fr>
In-Reply-To: <20240115113908.25897-1-tzimmermann@suse.de>
References: <20240115113908.25897-1-tzimmermann@suse.de>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, airlied@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>
