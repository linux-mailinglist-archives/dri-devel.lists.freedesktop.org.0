Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C76446E56
	for <lists+dri-devel@lfdr.de>; Sat,  6 Nov 2021 15:37:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E676E431;
	Sat,  6 Nov 2021 14:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0806E431
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Nov 2021 14:37:43 +0000 (UTC)
Date: Sat, 06 Nov 2021 14:37:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1636209460;
 bh=U0MZUFxkg3+UOPqNFrbWaEyCbKpVVLhO0H5Klvvg8Vk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=jAH6eVX/UxAKriZzPOkdkXwFKJbfZpDRfv7aduzDXMjJzrivplHuNM+RV5SYMzgTb
 Zn3uWTwG9eyECMh5UhUBA0yIX3VTj3kEQVBAp7eNxNXJkmwE6fw5uoU8vgOOIe9aES
 9gyaV2RndxrtSdjVZy/DIoDqRyYu9wkfnhaj7YawZwdhnr9SvffT73C7tQo9vYsOxX
 50wp++HoAYbgevrRGaMcqm7T1+eEX1LiKmd/zIQjHxwkScTs1wBwz7arNq53M/UfsN
 PgNCBkPLu7ucO9Ndz/xP7M6HSjnTOR0L8zKalf8Af2JBk8ynnxnkQdS5BoeV2WAD3z
 ME5JUGDWM5siQ==
To: Hans de Goede <hdegoede@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: panel-orientation-quirks: Add quirk for the Lenovo
 Yoga Book X91F/L
Message-ID: <19dCvydTSMwBjuBEnnGx3_lhgSLfEFicer86DC02LtI4ziJO9nmrJFuOm5oyTdATJbZcnJkO1OoDCWu1mAPKbcPoFuHS-M9MOYmPKJysNJo=@emersion.fr>
In-Reply-To: <20211106130227.11927-1-hdegoede@redhat.com>
References: <20211106130227.11927-1-hdegoede@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, Yauhen Kharuzhy <jekhor@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Simon Ser <contact@emersion.fr>
